package com.ht.scada.web.mvc;

import com.ht.scada.common.tag.entity.EndTag;
import com.ht.scada.common.tag.entity.MajorTag;
import com.ht.scada.common.tag.service.EndTagService;
import com.ht.scada.common.tag.service.MajorTagService;
import com.ht.scada.security.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
    
    @RequestMapping(method = RequestMethod.GET)
	public String main(Model model) {

        model.addAttribute("name", userService.getCurrentUser().getName());
        model.addAttribute("username", userService.getCurrentUser().getUsername());
        return "manage/wltp";
	}
}
