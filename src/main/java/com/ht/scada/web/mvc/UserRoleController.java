package com.ht.scada.web.mvc;

import com.ht.scada.common.user.entity.UserRole;
import com.ht.scada.common.user.service.UserService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 用户角色管理Controller
 *
 * @author hxy
 */
@Controller
@RequestMapping(value = "/admin/role")
public class UserRoleController {
    
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
}
