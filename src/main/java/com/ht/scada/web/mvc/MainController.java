package com.ht.scada.web.mvc;

import java.util.HashSet;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ht.scada.common.user.entity.User;
import com.ht.scada.common.user.entity.UserRole;
import com.ht.scada.common.user.service.UserService;

@Controller
@RequestMapping(value = "/main")
public class MainController {
	private static final Logger log = LoggerFactory.getLogger(RegisterController.class);

	@Autowired
	private UserService userService;
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String main() {
		return "main/index";
	}
	
	@RequestMapping(value = "test")
	public String test(RedirectAttributes redirectAttributes) {
		log.debug("初始化用户：{}/{}", "admin", "admin");
		userService.createUser("admin", "admin");
		//测试增加角色与角色权限
		userService.createUserRole("admin", "admin");
		UserRole ur = userService.getUserRoleByName("admin");
		Set<String> per = new HashSet<String>();
		per.add("aaa");
		per.add("bbb");
		ur.setPermissions(per);
		userService.saveUserRole(ur);
		User usr = userService.getUserByUsername("admin");
		usr.setUserRole(ur);
		userService.updateUser(usr);
		redirectAttributes.addFlashAttribute("username", "admin");
		redirectAttributes.addFlashAttribute("password", "admin");
		return "redirect:/login";

	}
}
