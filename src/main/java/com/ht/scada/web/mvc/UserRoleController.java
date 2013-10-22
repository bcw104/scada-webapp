package com.ht.scada.web.mvc;

import com.ht.scada.security.entity.UserRole;
import com.ht.scada.web.service.MenuService;
import com.ht.scada.security.service.UserService;
import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
    @Autowired
    private MenuService menuService;
    
    /**
     * 进入权限主页面
     * @return 
     */
    @RequestMapping(method = RequestMethod.GET)
    public String index(){
        return "sysmgr/userrole";
    }
    
    /**
     * 权限信息
     * @param id
     * @param model
     * @return 
     */
    @RequestMapping(value="roleMenu")
    public String roleMenu(@RequestParam("id") int id,Model model){
        model.addAttribute("roleid", id);
        model.addAttribute("role",userService.getUserRoleById(id));
        model.addAttribute("mtList", menuService.getAllMenuTypes());
        return "sysmgr/roleMenu";
        //return menuService.getAllMenuTypes();
    }
    
    /**
     * 权限列表
     * @return 
     */
    @RequestMapping(value = "list")
    @ResponseBody
    public List<UserRole> list(){
        return userService.getAllUserRole();
    }
    
    /**
     * 权限列表
     * @param userRole
     * @return 
     */
    @RequestMapping(value="saveRole")
    @ResponseBody
    public String saveRole(@ModelAttribute("preloadUserRole")UserRole userRole) {
        userService.saveUserRole(userRole);
        return "true";
    }
    
    /**
     * 删除权限
     * @param id
     * @return 
     */
    @RequestMapping(value="delUserRole")
    @ResponseBody
    public String delUserRole(int id) {
      //  User user=userService.getUser(userid);
        userService.deleteUserRole(id);
        return "true";
    }
    
    /**
     * 查找用户权限
     * @param roleId
     * @return 
     */
    @RequestMapping(value="findUserRoleByID")
    @ResponseBody
    public UserRole findUserRoleByID(String roleId) {
            log.debug(roleId);
            int rid=Integer.parseInt(roleId);
            return userService.getUserRoleById(rid);
    }
    
    /**
     * 角色权限
     * @param id
     * @return 
     */
    @ModelAttribute("preloadUserRole")
    public UserRole preLoadUserRole(@RequestParam(value = "id", required = false) Integer id) {
        log.debug(String.valueOf(id));
        if(id == null){
            return new UserRole();
        }
        return userService.getUserRoleById(id);
    }
    
    /**
     * 保存角色
     * @param userRole
     * @return 
     */
    @RequestMapping(value="saveRoleMenu")
    @ResponseBody
    public String saveRoleMenu(@ModelAttribute("preloadUserRoleMenu")UserRole userRole) {
       
        
        userService.saveUserRole(userRole);
        return "true";
    }
    
    /**
     * 用户角色
     * @param roleId
     * @param permissionsStr
     * @param type
     * @return 
     */
    @ModelAttribute("preloadUserRoleMenu")
    public UserRole preLoadUserRoleMenu(@RequestParam(value = "roleId", required = false) Integer roleId,String permissionsStr,String type) {
        log.debug(String.valueOf(roleId));
        if(roleId == null){
            return new UserRole();
        }
        if(type == null){
            return null;
        }
        UserRole userRole = userService.getUserRoleById(roleId);
        Set<String> per=new HashSet<String>();
        if(permissionsStr != null){
            CollectionUtils.addAll(per, permissionsStr.split(","));
        }
        userRole.setPermissions(per);
        return userRole;
    }
}
