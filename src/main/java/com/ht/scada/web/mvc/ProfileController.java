package com.ht.scada.web.mvc;

import javax.validation.Valid;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ht.scada.common.user.entity.User;
import com.ht.scada.common.user.security.ShiroDbRealm.ShiroUser;
import com.ht.scada.common.user.service.UserService;

/**
 * 用户修改自己资料的Controller.
 * 
 * @author calvin
 */
@Controller
@RequestMapping(value = "/profile")
public class ProfileController {

	@Autowired
	private UserService userService;

	@RequestMapping(method = RequestMethod.GET)
	public String updateForm(Model model) {
		Integer id = getCurrentUserId();
		model.addAttribute("user", userService.getUser(id));
		return "account/profile";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String update(@Valid @ModelAttribute("preloadUser") User user) {
		userService.updateUser(user);
		updateCurrentUserName(user.getName());
		return "redirect:/";
	}
	
	
	@ModelAttribute("preloadUser")
	public User getUser(@RequestParam(value = "id", required = false) Integer id) {
		if (id != null) {
			return userService.getUser(id);
		}
		return null;
	}

	/**
	 * 取出Shiro中的当前用户Id.
	 */
	private Integer getCurrentUserId() {
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		return user.id;
	}

	/**
	 * 更新Shiro中当前用户的用户名.
	 */
	private void updateCurrentUserName(String userName) {
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		user.name = userName;
	}
}
