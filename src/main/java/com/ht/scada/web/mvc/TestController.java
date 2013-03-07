package com.ht.scada.web.mvc;

import com.ht.scada.common.user.entity.User;
import com.ht.scada.common.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/test")
public class TestController {
    @Autowired
	private UserService userService;
    
    @RequestMapping(value = "test",method = RequestMethod.GET)
    public String index() {
        return "test/index";
    }
    @RequestMapping(value = "save")
    @ResponseBody
    public User save(@ModelAttribute("preloadUser") User user) {
        return user;
    }
    @ModelAttribute("preloadUser")
	public User getUser(@RequestParam(value = "rolename", required = false) String rolename) {
        User user = userService.getUser(1);
		if (rolename != null) {
			user.setUserRole(userService.getUserRoleByName(rolename));
		}
		return user;
	}
    
}
