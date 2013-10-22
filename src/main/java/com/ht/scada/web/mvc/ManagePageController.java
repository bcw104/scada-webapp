package com.ht.scada.web.mvc;

import com.ht.scada.security.entity.User;
import com.ht.scada.security.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 调度运行页面操作
 * @author Administrator
 */
@Controller
@RequestMapping(value = "/managepage")
public class ManagePageController {
    
    private static final Logger log = LoggerFactory.getLogger(RegisterController.class);	
    
    @Autowired
	private UserService userService;
    
    /**
     * 进入调度运行主页面
     * @param model
     * @return 
     */
    @RequestMapping(method = RequestMethod.GET)
	public String main(Model model) {

        User user = (User)userService.getCurrentUser();
        if(user.getUserRole().getPermissions().size() > 0 && user.getUserRole().getPermissions().contains("sysmgr")){
            model.addAttribute("sysmgr", 1);
        }else{
            model.addAttribute("sysmgr", 0);
        }
        
        model.addAttribute("name", userService.getCurrentUser().getName());
        model.addAttribute("username", userService.getCurrentUser().getUsername());
        return "manage/wltp";
	}
}
