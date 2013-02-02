package com.ht.scada.web.mvc;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ht.scada.common.user.entity.User;
import com.ht.scada.common.user.service.UserService;

/**
 * 管理员管理用户的Controller.
 * 
 * @author 薄成文
 */
@Controller
@RequestMapping(value = "/admin/user")
public class UserAdminController {

	@Autowired
	private UserService userService;

	@RequestMapping(method = RequestMethod.GET)
	public String list(Model model) {
		List<User> users = userService.getAllUsers();
		model.addAttribute("users", users);

		return "account/adminUserList";
	}

	/**
	 * http://127.0.0.1:8080/scada-webapp/admin/user/update/1
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Integer id, Model model) {
		model.addAttribute("user", userService.getUser(id));
		return "account/adminUserForm";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@Valid @ModelAttribute("preloadUser") User user, RedirectAttributes redirectAttributes) {
		userService.updateUser(user);
		redirectAttributes.addFlashAttribute("message", "更新用户" + user.getUsername() + "成功");
		return "redirect:/admin/user";
	}

	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes) {
		User user = userService.getUser(id);
		userService.deleteUser(id);
		redirectAttributes.addFlashAttribute("message", "删除用户" + user.getUsername() + "成功");
		return "redirect:/admin/user";
	}

	/**
	 * 使用@ModelAttribute, 实现Struts2 Preparable二次部分绑定的效果,先根据form的id从数据库查出User对象,再把Form提交的内容绑定到该对象上。
	 * 因为仅update()方法的form中有id属性，因此本方法在该方法中执行.
	 */
	@ModelAttribute("preloadUser")
	public User getUser(@RequestParam(value = "id", required = false) Integer id) {
		if (id != null) {
			return userService.getUser(id);
		}
		return null;
	}
	
	@RequestMapping("info/{id}")
	@ResponseBody
	public User userInfo(@RequestParam(value = "id", required = false) Integer id) {
		if (id != null) {
			return userService.getUser(id);
		}
		return null;
	}
	
	@RequestMapping(value="test.json")
	@ResponseBody
	public String test(@RequestBody User user) {
		return "{'a':1}";
	}
}
