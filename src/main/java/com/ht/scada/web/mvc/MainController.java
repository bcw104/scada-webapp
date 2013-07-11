package com.ht.scada.web.mvc;

import com.ht.scada.common.tag.entity.EndTag;
import com.ht.scada.common.tag.service.EndTagService;
import com.ht.scada.security.entity.User;
import com.ht.scada.security.entity.UserRole;
import com.ht.scada.security.service.UserService;
import java.util.Date;
import java.util.HashMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/main")
public class MainController {
	private static final Logger log = LoggerFactory.getLogger(RegisterController.class);
	@Autowired
	private UserService userService;
    @Autowired
    private EndTagService endTagService;
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
    /**
     * 进入管理系统主页
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
		return "main/ssjc";
	}
    
    /**
     * 进入管理系统--系统管理部分
     * @return 
     */
	@RequestMapping(value="mgr")
	public String mgr(Model model) {

        User user = (User)userService.getCurrentUser();
        if(user.getUserRole().getPermissions().size() > 0 && user.getUserRole().getPermissions().contains("sysmgr")){
            model.addAttribute("sysmgr", 1);
        }else{
            model.addAttribute("sysmgr", 0);
            return "account/login";
            
        }
        
        model.addAttribute("name", user.getName());
        model.addAttribute("username", user.getUsername());
        return "main/index";
	}
    
    @RequestMapping(value="cyj")
	public String cyj(@RequestParam("id") int id,Model model) {
        
        User user = (User)userService.getCurrentUser();
        if(user.getUserRole().getPermissions().size() > 0 && user.getUserRole().getPermissions().contains("sysmgr")){
            model.addAttribute("sysmgr", 1);
        }else{
            model.addAttribute("sysmgr", 0);
        }
        
        EndTag endTag = endTagService.getById(id);
		model.addAttribute("id", id);
        model.addAttribute("info", endTag);
        model.addAttribute("name", userService.getCurrentUser().getName());
        model.addAttribute("username", userService.getCurrentUser().getUsername());
        return "main/ssjcmain";
	}
    
    @RequestMapping(value="dqb")
	public String dqb(@RequestParam("id") int id,Model model) {
        
        User user = (User)userService.getCurrentUser();
        if(user.getUserRole().getPermissions().size() > 0 && user.getUserRole().getPermissions().contains("sysmgr")){
            model.addAttribute("sysmgr", 1);
        }else{
            model.addAttribute("sysmgr", 0);
        }
        
        EndTag endTag = endTagService.getById(id);
		model.addAttribute("id", id);
        model.addAttribute("info", endTag);
        model.addAttribute("name", userService.getCurrentUser().getName());
        model.addAttribute("username", userService.getCurrentUser().getUsername());
        return "main/ssjcdqb";
	}
    
    @RequestMapping(value="zp")
	public String zp(@RequestParam("id") int id,Model model) {
        
        User user = (User)userService.getCurrentUser();
        if(user.getUserRole().getPermissions().size() > 0 && user.getUserRole().getPermissions().contains("sysmgr")){
            model.addAttribute("sysmgr", 1);
        }else{
            model.addAttribute("sysmgr", 0);
        }
        
        EndTag endTag = endTagService.getById(id);
		model.addAttribute("id", id);
        model.addAttribute("info", endTag);
        model.addAttribute("name", userService.getCurrentUser().getName());
        model.addAttribute("username", userService.getCurrentUser().getUsername());
        return "main/ssjczp";
	}
    
    @RequestMapping(value="mj")
	public String mj(@RequestParam("id") int id,Model model) {
        
        User user = (User)userService.getCurrentUser();
        if(user.getUserRole().getPermissions().size() > 0 && user.getUserRole().getPermissions().contains("sysmgr")){
            model.addAttribute("sysmgr", 1);
        }else{
            model.addAttribute("sysmgr", 0);
        }
        
        EndTag endTag = endTagService.getById(id);
		model.addAttribute("id", id);
        model.addAttribute("info", endTag);
        model.addAttribute("name", userService.getCurrentUser().getName());
        model.addAttribute("username", userService.getCurrentUser().getUsername());
        return "main/ssjcmj";
	}
    
    @RequestMapping(value="lgb")
	public String lgb(@RequestParam("id") int id,Model model) {
        
        User user = (User)userService.getCurrentUser();
        if(user.getUserRole().getPermissions().size() > 0 && user.getUserRole().getPermissions().contains("sysmgr")){
            model.addAttribute("sysmgr", 1);
        }else{
            model.addAttribute("sysmgr", 0);
        }
        
        EndTag endTag = endTagService.getById(id);
		model.addAttribute("id", id);
        model.addAttribute("info", endTag);
        model.addAttribute("name", userService.getCurrentUser().getName());
        model.addAttribute("username", userService.getCurrentUser().getUsername());
        return "main/ssjclgb";
	}
    
    @RequestMapping(value="zq")
	public String zq(@RequestParam("id") int id,Model model) {
        
        User user = (User)userService.getCurrentUser();
        if(user.getUserRole().getPermissions().size() > 0 && user.getUserRole().getPermissions().contains("sysmgr")){
            model.addAttribute("sysmgr", 1);
        }else{
            model.addAttribute("sysmgr", 0);
        }
        
        EndTag endTag = endTagService.getById(id);
		model.addAttribute("id", id);
        model.addAttribute("info", endTag);
        model.addAttribute("name", userService.getCurrentUser().getName());
        model.addAttribute("username", userService.getCurrentUser().getUsername());
        return "main/ssjczq";
	}
    
    @RequestMapping(value="glj")
	public String glj(@RequestParam("id") int id,Model model) {
        
        User user = (User)userService.getCurrentUser();
        if(user.getUserRole().getPermissions().size() > 0 && user.getUserRole().getPermissions().contains("sysmgr")){
            model.addAttribute("sysmgr", 1);
        }else{
            model.addAttribute("sysmgr", 0);
        }
        
        EndTag endTag = endTagService.getById(id);
		model.addAttribute("id", id);
        model.addAttribute("info", endTag);
        model.addAttribute("name", userService.getCurrentUser().getName());
        model.addAttribute("username", userService.getCurrentUser().getUsername());
        return "main/ssjcglj";
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
    
    @RequestMapping(value="logincheck")    
    @ResponseBody
	public Map logincheck() {
        
        Map map = new HashMap<>();
        User user = (User)userService.getCurrentUser();
        
        if(user == null){
            map.put("state", "1");
        }else{
            map.put("state", "0");
        }
        return map;
	}
}
