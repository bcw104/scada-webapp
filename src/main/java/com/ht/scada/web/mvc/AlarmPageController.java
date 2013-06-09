package com.ht.scada.web.mvc;

import com.ht.scada.common.tag.entity.EndTag;
import com.ht.scada.common.tag.service.EndTagService;
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
    private EndTagService endTagService;
    
	@RequestMapping(method = RequestMethod.GET)
	public String main() {

        return "alarm/bjxix";
	}
    
    @RequestMapping(value="cyj")
	public String cyj(@RequestParam("id") int id, @RequestParam("actionTime") String actionTime, Model model) {
        
        EndTag endTag = endTagService.getById(id);
		model.addAttribute("id", id);
        model.addAttribute("info", endTag);
        model.addAttribute("actionTime", actionTime);
        return "alarm/ssjcmain";
	}
    
    @RequestMapping(value="dqb")
	public String dqb(@RequestParam("id") int id,@RequestParam("actionTime") String actionTime, Model model) {
        
        EndTag endTag = endTagService.getById(id);
		model.addAttribute("id", id);
        model.addAttribute("info", endTag);
        model.addAttribute("actionTime", actionTime);
        return "alarm/ssjcdqb";
	}
    
    @RequestMapping(value="zp")
	public String zp(@RequestParam("id") int id, @RequestParam("actionTime") String actionTime, Model model) {
        
        EndTag endTag = endTagService.getById(id);
		model.addAttribute("id", id);
        model.addAttribute("info", endTag);
        model.addAttribute("actionTime", actionTime);
        return "alarm/ssjczp";
	}
    
    @RequestMapping(value="mj")
	public String mj(@RequestParam("id") int id, @RequestParam("actionTime") String actionTime, Model model) {
        
        EndTag endTag = endTagService.getById(id);
		model.addAttribute("id", id);
        model.addAttribute("info", endTag);
        model.addAttribute("actionTime", actionTime);
        return "alarm/ssjcmj";
	}
    
    @RequestMapping(value="lgb")
	public String lgb(@RequestParam("id") int id, @RequestParam("actionTime") String actionTime, Model model) {
        
        EndTag endTag = endTagService.getById(id);
		model.addAttribute("id", id);
        model.addAttribute("info", endTag);
        model.addAttribute("actionTime", actionTime);
        return "alarm/ssjclgb";
	}
    
    @RequestMapping(value="zq")
	public String zq(@RequestParam("id") int id, @RequestParam("actionTime") String actionTime, Model model) {
        
        EndTag endTag = endTagService.getById(id);
		model.addAttribute("id", id);
        model.addAttribute("info", endTag);
        model.addAttribute("actionTime", actionTime);
        return "alarm/ssjczq";
	}
    
    @RequestMapping(value="glj")
	public String glj(@RequestParam("id") int id, @RequestParam("actionTime") String actionTime, Model model) {
        
        EndTag endTag = endTagService.getById(id);
		model.addAttribute("id", id);
        model.addAttribute("info", endTag);
        model.addAttribute("actionTime", actionTime);
        return "alarm/ssjcglj";
	}
}
