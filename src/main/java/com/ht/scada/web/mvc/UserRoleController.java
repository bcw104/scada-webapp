package com.ht.scada.web.mvc;

import com.ht.scada.common.user.entity.UserRole;
import com.ht.scada.common.user.service.UserService;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 用户角色管理Controller
 *
 * @author hxy
 */
@Controller
@RequestMapping(value = "/admin/role")
public class UserRoleController {
    private static final Logger log = LoggerFactory.getLogger(UserAdminController.class);
    @Autowired
    private UserService userService;
    
    @RequestMapping(method = RequestMethod.GET)
    public String index(){
        return "sysmgr/userrole";
    }

    @RequestMapping(value = "list")
    @ResponseBody
    public List<UserRole> list(){
        return userService.getAllUserRole();
    }
    @RequestMapping(value="saveRole")
    @ResponseBody
    public String saveRole(@ModelAttribute("preloadUserRole")UserRole userRole) {
        userService.saveUserRole(userRole);
        return "true";
    }
    @RequestMapping(value="delUserRole")
    @ResponseBody
    public String delUserRole(int id) {
      //  User user=userService.getUser(userid);
        userService.deleteUserRole(id);
        return "true";
    }
    @RequestMapping(value="findUserRoleByUserID")
    @ResponseBody
    public UserRole findUserRoleByUserID(String roleId) {
            log.debug(roleId);
            int rid=Integer.parseInt(roleId);
            return userService.getUserRoleById(rid);
    }
    
    @ModelAttribute("preloadUserRole")
    public UserRole preLoadUserRole(@RequestParam(value = "id", required = false) Integer id) {
        log.debug(String.valueOf(id));
        if(id == null){
            return new UserRole();
        }
        return userService.getUserRoleById(id);
    }
}
