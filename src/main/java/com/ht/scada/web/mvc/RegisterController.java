package com.ht.scada.web.mvc;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ht.scada.common.user.entity.User;
import com.ht.scada.common.user.service.UserService;

/**
 * 用户注册的Controller.
 * 
 * @author 薄成文
 */
@Controller
@RequestMapping(value = "/register")
public class RegisterController {
	private static final Logger log = LoggerFactory.getLogger(RegisterController.class);

	@Autowired
	private UserService userService;

	@RequestMapping(method = RequestMethod.GET)
	public String registerForm() {
		return "account/register";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String register(String name, String username, @RequestParam String password, RedirectAttributes redirectAttributes) {
		log.debug("用户注册：{}/{}", username, password);
		userService.createUser(username, password);
		redirectAttributes.addFlashAttribute("username", username);
		return "redirect:/login";
	}

	/**
	 * Ajax请求校验loginName是否唯一。
	 */
	@RequestMapping(value = "checkLoginName")
	@ResponseBody
	public String checkLoginName(@RequestParam("loginName") String userName) {
		if (userService.getUserByUsername(userName) == null) {
			return "true";
		} else {
			return "false";
		}
	}
}
