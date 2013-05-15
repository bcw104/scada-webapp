package com.ht.scada.web.mvc;

import com.ht.scada.security.entity.User;
import com.ht.scada.security.entity.UserExtInfo;
import com.ht.scada.security.entity.UserRole;
import com.ht.scada.security.service.UserService;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;

/**
 * 管理员管理用户的Controller.
 * 
 * @author 薄成文
 */
@Controller
@RequestMapping(value = "/admin/user")
public class UserAdminController {
	private static final Logger log = LoggerFactory.getLogger(UserAdminController.class);
	
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
	@RequestMapping(value="pass")
	public String password(){
		return "account/password";
	}
	@RequestMapping(value="userManage")
	public String userManage(){
		return "account/userManage";
	}
	@RequestMapping(value="updatePassWord", method = RequestMethod.POST)
	public String updatePassWord(String oldpass,String newPass,String rePass,Model model) {
		User user = userService.getCurrentUser();
		if(!rePass.equals(newPass)){
			model.addAttribute("message", "新设密码与原始密码不相符，请重新输入!");
			return "account/password";
		}
		if(!user.getPassword().equals(new Sha256Hash(oldpass).toHex())){
			model.addAttribute("message", "原始密码不正确！");
			return "account/password";
		}
		
		userService.updateUserPassword(new Sha256Hash(newPass).toHex(), user.getId());
		model.addAttribute("message", "密码修改成功！");
		return "account/password";
	}
	@RequestMapping(value="findUser")
	@ResponseBody
	public List<UserExtInfo> findUser() {
		return userService.getAllUserExtInfo();
	}
        @RequestMapping(value="updatePass")
	@ResponseBody
	public String updatePass(String newPass,String rePass,int userID) {
                if(!rePass.equals(newPass)){	
			return "passWorng";
		}
		userService.updateUserPassword(new Sha256Hash(newPass).toHex(), userID);
		return "true";
	}
        @RequestMapping(value="addUser")
        @ResponseBody
	public String addUser(UserExtInfo userExtInfo,int role_id,Model model) {
            //user.setUserRole(userRole);
            // userExtInfo.setUser(user);
            //userService.addNewUser(user);
            UserRole role = userService.getUserRoleById(role_id);
            userExtInfo.getUser().setUserRole(role);
            userService.saveUserExtInfo(userExtInfo);
            return "true";
	}
        @RequestMapping(value="delUserExtInfo")
        @ResponseBody
	public String delUserExtInfo(int userid) {
          //  User user=userService.getUser(userid);
            userService.deleteUser(userid);
            return "true";
	}
        @RequestMapping(value="findUserExtInfoByUserID")
	@ResponseBody
	public UserExtInfo findUserExtInfoByUserID(String userID) {
                log.debug(userID);
                int uid=Integer.parseInt(userID);
		return userService.findUserExtInfoByUserID(uid);
	}
        @RequestMapping(value="updateUserExtInfo")
        @ResponseBody
	public String updateUser(@ModelAttribute("preloadUserExtInfo")UserExtInfo userExtInfo,Model model) {
//            UserRole role = userService.getUserRoleById(role_id);
//            userExtInfo.getUser().setUserRole(role);
            userService.saveUserExtInfo(userExtInfo);
            return "true";
	}
        @ModelAttribute("preloadUserExtInfo")
        public UserExtInfo preloadUserExtInfo(@RequestParam(value = "user_id", required = false) Integer user_id,@RequestParam(value = "role_id", required = false)Integer role_id){
            if(user_id  != null){
                UserExtInfo extInfo = userService.findUserExtInfoByUserID(user_id);
                extInfo.getUser().setUserRole(userService.getUserRoleById(role_id));
                return extInfo;
            }
            return null;
        }
}
