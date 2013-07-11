package com.ht.scada.web.mvc;

import com.ht.scada.security.entity.User;
import com.ht.scada.security.entity.UserRole;
import com.ht.scada.security.service.UserService;
import com.ht.scada.web.entity.MenuItem;
import com.ht.scada.web.entity.MenuType;
import com.ht.scada.web.entity.UserExtInfo;
import com.ht.scada.web.service.MenuService;
import com.ht.scada.web.service.UserExtInfoService;
import java.util.HashSet;
import java.util.Set;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
@Controller
@RequestMapping(value = "/sysinit")
public class SysInitController {
    private static final Logger log = LoggerFactory.getLogger(SysInitController.class);
    
	@Autowired
	private UserService userService;
    @Autowired
	private UserExtInfoService userExtInfoService;
    @Autowired
	private MenuService menuService;
    /**
     * 系统初始化,建默认用户及分配置后台管理权限
     * @return 
     */
	@RequestMapping(method = RequestMethod.GET)
    @ResponseBody
	public String test(RedirectAttributes redirectAttributes) {
        
		log.debug("初始化用户：{}/{}", "admin", "admin");
        User user = userService.getUserByUsername("admin");
        if(user != null){
            return "System has been initialized!";
        }
		userService.createUser("admin", "admin");
		//测试增加角色与角色权限
		userService.createUserRole("admin", "admin");
		UserRole ur = userService.getUserRoleByName("admin");
		Set<String> per = new HashSet<>();
		per.add("sysmgr");
		ur.setPermissions(per);
		userService.saveUserRole(ur);
		User usr = userService.getUserByUsername("admin");
		usr.setUserRole(ur);
        usr.setName("管理员");
		userService.updateUser(usr);
        UserExtInfo userExt = new UserExtInfo();
        userExt.setUser(usr);
        userExt.setRealName("管理员");
        userExtInfoService.saveUserExtInfo(userExt);
        MenuType menuType = new MenuType();
        MenuItem menuItem = new MenuItem();
        menuItem.setMenuItemName("系统管理");
        menuItem.setMenuType(menuType);
        menuItem.setPname("sysmgr");
        menuItem.setMenuItemUrl("");
        menuType.setMenuTypeName("系统管理");
        menuService.insertMenuType(menuType);
        menuService.insertMenuItem(menuItem);
		return "System initialization is complete! ";

	}
}
