package com.ht.scada.web.mvc;

import com.ht.scada.common.tag.entity.EndTag;
import com.ht.scada.common.tag.service.EndTagService;
import com.ht.scada.security.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/alarmpage")
public class AlarmPageController {
    
	private static final Logger log = LoggerFactory.getLogger(RegisterController.class);	
    
    @Autowired
	private UserService userService;
    @Autowired
    private EndTagService endTagService;
    
	@RequestMapping(method = RequestMethod.GET)
	public String main(Model model) {

        model.addAttribute("name", userService.getCurrentUser().getName());
        model.addAttribute("username", userService.getCurrentUser().getUsername());
        return "alarm/bjxix";
	}
    
    @RequestMapping(value="cyj")
	public String cyj(@RequestParam("id") int id, @RequestParam("actionTime") String actionTime, Model model) {
        
        EndTag endTag = endTagService.getById(id);
		model.addAttribute("id", id);
        model.addAttribute("info", endTag);
        model.addAttribute("actionTime", actionTime);
        model.addAttribute("name", userService.getCurrentUser().getName());
        model.addAttribute("username", userService.getCurrentUser().getUsername());
        return "alarm/ssjcmain";
	}
    
    @RequestMapping(value="dqb")
	public String dqb(@RequestParam("id") int id,@RequestParam("actionTime") String actionTime, Model model) {
        
        EndTag endTag = endTagService.getById(id);
		model.addAttribute("id", id);
        model.addAttribute("info", endTag);
        model.addAttribute("actionTime", actionTime);
        model.addAttribute("name", userService.getCurrentUser().getName());
        model.addAttribute("username", userService.getCurrentUser().getUsername());
        return "alarm/ssjcdqb";
	}
    
    @RequestMapping(value="zp")
	public String zp(@RequestParam("id") int id, @RequestParam("actionTime") String actionTime, Model model) {
        
        EndTag endTag = endTagService.getById(id);
		model.addAttribute("id", id);
        model.addAttribute("info", endTag);
        model.addAttribute("actionTime", actionTime);
        model.addAttribute("name", userService.getCurrentUser().getName());
        model.addAttribute("username", userService.getCurrentUser().getUsername());
        return "alarm/ssjczp";
	}
    
    @RequestMapping(value="mj")
	public String mj(@RequestParam("id") int id, @RequestParam("actionTime") String actionTime, Model model) {
        
        EndTag endTag = endTagService.getById(id);
		model.addAttribute("id", id);
        model.addAttribute("info", endTag);
        model.addAttribute("actionTime", actionTime);
        model.addAttribute("name", userService.getCurrentUser().getName());
        model.addAttribute("username", userService.getCurrentUser().getUsername());
        return "alarm/ssjcmj";
	}
    
    @RequestMapping(value="lgb")
	public String lgb(@RequestParam("id") int id, @RequestParam("actionTime") String actionTime, Model model) {
        
        EndTag endTag = endTagService.getById(id);
		model.addAttribute("id", id);
        model.addAttribute("info", endTag);
        model.addAttribute("actionTime", actionTime);
        model.addAttribute("name", userService.getCurrentUser().getName());
        model.addAttribute("username", userService.getCurrentUser().getUsername());
        return "alarm/ssjclgb";
	}
    
    @RequestMapping(value="zq")
	public String zq(@RequestParam("id") int id, @RequestParam("actionTime") String actionTime, Model model) {
        
        EndTag endTag = endTagService.getById(id);
		model.addAttribute("id", id);
        model.addAttribute("info", endTag);
        model.addAttribute("actionTime", actionTime);
        model.addAttribute("name", userService.getCurrentUser().getName());
        model.addAttribute("username", userService.getCurrentUser().getUsername());
        return "alarm/ssjczq";
	}
    
    @RequestMapping(value="glj")
	public String glj(@RequestParam("id") int id, @RequestParam("actionTime") String actionTime, Model model) {
        
        EndTag endTag = endTagService.getById(id);
		model.addAttribute("id", id);
        model.addAttribute("info", endTag);
        model.addAttribute("actionTime", actionTime);
        model.addAttribute("name", userService.getCurrentUser().getName());
        model.addAttribute("username", userService.getCurrentUser().getUsername());
        return "alarm/ssjcglj";
	}

    @RequestMapping(value="mobilesgt")
    public String mobilesgt(String code,String date, Model model){
        model.addAttribute("code", code);
        model.addAttribute("sdate", date);
        return "gtqx/sgt";
    }
    @RequestMapping(value="mobiledlqx")
    public String mobiledlqx(String code,String date, Model model){
        model.addAttribute("code", code);
        model.addAttribute("sdate", date);
        return "gtqx/dlqx";
    }
    @RequestMapping(value="mobiledgt")
    public String mobiledgt(String code,String date, Model model){
        model.addAttribute("code", code);
        model.addAttribute("sdate", date);
        return "gtqx/dgt";
    }
    @RequestMapping(value="mobileygglqx")
    public String mobileygglqx(String code,String date, Model model){
        model.addAttribute("code", code);
        model.addAttribute("sdate", date);
        return "gtqx/ygglqx";
    }
}