package com.ht.scada.web.mvc;

import com.ht.scada.common.tag.entity.EndTag;
import com.ht.scada.common.tag.entity.MajorTag;
import com.ht.scada.common.tag.service.EndTagService;
import com.ht.scada.common.tag.service.MajorTagService;
import com.ht.scada.security.entity.User;
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
 * 生产动态页面操作
 * @author Administrator
 */
@Controller
@RequestMapping(value = "/performancepage")
public class PerformancePageController {
    
    private static final Logger log = LoggerFactory.getLogger(RegisterController.class);	
    
    @Autowired
	private UserService userService;
    @Autowired
    private EndTagService endTagService;
    @Autowired
    private MajorTagService majorTagService;
    
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
        return "performance/scdt";
	}

    @RequestMapping(value="majortagpage")
	public String majortagpage(@RequestParam("id") int id, Model model) {

        User user = (User)userService.getCurrentUser();
        if(user.getUserRole().getPermissions().size() > 0 && user.getUserRole().getPermissions().contains("sysmgr")){
            model.addAttribute("sysmgr", 1);
        }else{
            model.addAttribute("sysmgr", 0);
        }
        
        MajorTag majorTag = majorTagService.getById(id);
        model.addAttribute("info", majorTag);
        model.addAttribute("name", userService.getCurrentUser().getName());
        model.addAttribute("username", userService.getCurrentUser().getUsername());
        return "performance/scdt_majortag";
	}

    @RequestMapping(value="endtagpage")
	public String endtagpage(@RequestParam("id") int id, Model model) {

        User user = (User)userService.getCurrentUser();
        if(user.getUserRole().getPermissions().size() > 0 && user.getUserRole().getPermissions().contains("sysmgr")){
            model.addAttribute("sysmgr", 1);
        }else{
            model.addAttribute("sysmgr", 0);
        }
        
        EndTag endTag = endTagService.getById(id);
        model.addAttribute("info", endTag);
        model.addAttribute("name", userService.getCurrentUser().getName());
        model.addAttribute("username", userService.getCurrentUser().getUsername());
        return "performance/scdt_endtag";
	}
}
