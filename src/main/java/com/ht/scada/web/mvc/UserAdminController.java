package com.ht.scada.web.mvc;

import com.ht.scada.common.tag.entity.EndTag;
import com.ht.scada.common.tag.entity.MajorTag;
import com.ht.scada.common.tag.service.MajorTagService;
import com.ht.scada.security.entity.User;
import com.ht.scada.web.entity.UserExtInfo;
import com.ht.scada.security.entity.UserRole;
import com.ht.scada.security.service.UserService;
import com.ht.scada.web.service.UserExtInfoService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 管理员管理用户的Controller.
 * 
 * @author 薄成文
 */
@Controller
@RequestMapping(value = "/admin/user")
public class UserAdminController {
	private static final Logger log = LoggerFactory.getLogger(UserAdminController.class);
	
	@Autowired
	private UserService userService;
    @Autowired
	private UserExtInfoService userExtInfoService;
    @Autowired
	private MajorTagService majorTagService;

	@RequestMapping(method = RequestMethod.GET)
	public String list(Model model) {
		List<User> users = userService.getAllUsers();
		model.addAttribute("users", users);

		return "account/adminUserList";
	}

	/**
	 * http://127.0.0.1:8080/scada-webapp/admin/user/update/1
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Integer id, Model model) {
		model.addAttribute("user", userService.getUser(id));
		return "account/adminUserForm";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@Valid @ModelAttribute("preloadUser") User user, RedirectAttributes redirectAttributes) {
		userService.updateUser(user);
		redirectAttributes.addFlashAttribute("message", "更新用户" + user.getUsername() + "成功");
		return "redirect:/admin/user";
	}

	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes) {
		User user = userService.getUser(id);
		userService.deleteUser(id);
		redirectAttributes.addFlashAttribute("message", "删除用户" + user.getUsername() + "成功");
		return "redirect:/admin/user";
	}

	/**
	 * 使用@ModelAttribute, 实现Struts2 Preparable二次部分绑定的效果,先根据form的id从数据库查出User对象,再把Form提交的内容绑定到该对象上。
	 * 因为仅update()方法的form中有id属性，因此本方法在该方法中执行.
	 */
	@ModelAttribute("preloadUser")
	public User getUser(@RequestParam(value = "id", required = false) Integer id) {
		if (id != null) {
			return userService.getUser(id);
		}
		return null;
	}
	
	@RequestMapping("info/{id}")
	@ResponseBody
	public User userInfo(@RequestParam(value = "id", required = false) Integer id) {
		if (id != null) {
			return userService.getUser(id);
		}
		return null;
	}
	
	@RequestMapping(value="test.json")
	@ResponseBody
	public String test(@RequestBody User user) {
		return "{'a':1}";
	}
	@RequestMapping(value="pass")
	public String password(){
		return "account/password";
	}
	@RequestMapping(value="userManage")
	public String userManage(){
		return "account/userManage";
	}
	@RequestMapping(value="updatePassWord", method = RequestMethod.POST)
	public String updatePassWord(String oldpass,String newPass,String rePass,Model model) {
		User user = userService.getCurrentUser();
		if(!rePass.equals(newPass)){
			model.addAttribute("message", "新设密码与原始密码不相符，请重新输入!");
			return "account/password";
		}
		if(!user.getPassword().equals(new Sha256Hash(oldpass).toHex())){
			model.addAttribute("message", "原始密码不正确！");
			return "account/password";
		}
		
		userService.updateUserPassword(new Sha256Hash(newPass).toHex(), user.getId());
		model.addAttribute("message", "密码修改成功！");
		return "account/password";
	}
    
    /**
     * 获得用户信息
     * @return 用户信息列表
     * 2013-05-25 赵玮 修改
     */
	@RequestMapping(value="findUser")
	@ResponseBody
	public List<UserExtInfo> findUser() {
        
        // 扩展用户信息
        UserExtInfo userExtInfo = null;
        // 用户基本信息列表
        List<User> lstUser = userService.getAllUsers();
        
        // 遍历基本用户信息
        for(User loopUser : lstUser){
            
            // 判断是否存在扩展用户信息
            if(userExtInfoService.findUserExtInfoByUserID(loopUser.getId()) == null){
                
                userExtInfo = new UserExtInfo();
                userExtInfo.setUser(loopUser);
                userExtInfoService.saveUserExtInfo(userExtInfo);
            }
        }
        
		return userExtInfoService.getAllUserExtInfo();
	}
    
    @RequestMapping(value="updatePass")
	@ResponseBody
	public String updatePass(String newPass,String rePass,int userID) {
                if(!rePass.equals(newPass)){	
			return "passWorng";
		}
		userService.updateUserPassword(new Sha256Hash(newPass).toHex(), userID);
		return "true";
	}
    
    @RequestMapping(value="addUser")
    @ResponseBody
	public String addUser(UserExtInfo userExtInfo,int role_id,Model model) {

        UserRole role = userService.getUserRoleById(role_id);
        
        userExtInfo.getUser().setUserRole(role);
        userExtInfo.getUser().setName(userExtInfo.getRealName());        
        userExtInfoService.saveUserExtInfo(userExtInfo);
        return "true";
	}
    
    @RequestMapping(value="delUserExtInfo")
    @ResponseBody
	public String delUserExtInfo(int id) {
        
        userExtInfoService.deleteUser(id);
        return "true";
	}
    @RequestMapping(value="findUserExtInfoByUserID")
	@ResponseBody
	public UserExtInfo findUserExtInfoByUserID(String userID) {
                log.debug(userID);
                int uid=Integer.parseInt(userID);
		return userExtInfoService.findUserExtInfoByUserID(uid);
	}
    
    @RequestMapping(value="updateUserExtInfo")
    @ResponseBody
	public String updateUser(@ModelAttribute("preloadUserExtInfo")UserExtInfo userExtInfo,Model model) {

        userExtInfo.getUser().setName(userExtInfo.getRealName());
        userExtInfoService.saveUserExtInfo(userExtInfo);
        return "true";
	}
    
    @ModelAttribute("preloadUserExtInfo")
    public UserExtInfo preloadUserExtInfo(@RequestParam(value = "user_id", required = false) Integer user_id, 
        @RequestParam(value = "role_id", required = false)Integer role_id){
        if(user_id  != null){
            UserExtInfo extInfo = userExtInfoService.findUserExtInfoByUserID(user_id);
            extInfo.getUser().setUserRole(userService.getUserRoleById(role_id));
            return extInfo;
        }
        return null;
    }
    
    @RequestMapping(value="checkUserName")
	@ResponseBody
	public String checkUserName(String userName) {
        
        UserExtInfo userExtInfo = userExtInfoService.findUserExtInfoByUserName(userName);
        
        if(userExtInfo != null){
            
            return "false";
        }
        
        return "true";
    }
    
    @RequestMapping(value="userPermissionList")
    public String userPermissionList(@RequestParam("id") int id,Model model){
        model.addAttribute("userid", id);
        model.addAttribute("user", userService.findUserByUserID(id));
//        model.addAttribute("perList", majorTagService.getRootMajorTag());
        
        return "account/permissionList";
    }
    
    @RequestMapping(value="permissionList")
    @ResponseBody
    public Map<String,Object> permissionList(@RequestParam("id") int id){
        
        Map<String,Object> map = null; 
        List<Map> lstChildren =  null; 
        List<Map> lstEndChildren =  null;        
        
        List<Map> listResult = new ArrayList<>();
        Map<String,Object> mapResult = new HashMap<String,Object>();  

        List<MajorTag> lstMajorTag = majorTagService.getRootMajorTag();
        UserExtInfo userExtInfo = userExtInfoService.findUserExtInfoByUserID(id);
                        
        for(MajorTag tagTmp : lstMajorTag){
            
            map = new HashMap<String,Object>();  
            map.put("id", tagTmp.getId());
            map.put("text", tagTmp.getName());                    
            
            // 判断是否存在子集
            if(tagTmp.getChildren().size() > 0 || tagTmp.getEndTagList().size() > 0){
                
                lstChildren =  new ArrayList<>(); 
                lstEndChildren =  new ArrayList<>();    
        
                // major_tag
                if(tagTmp.getChildren().size() > 0){
                    
                    lstChildren = permissionListItem(tagTmp.getChildren(), userExtInfo);
                }

                // end_tag
                if(tagTmp.getEndTagList().size() > 0){
                    
                    lstEndChildren = permissionListEndItem(tagTmp.getEndTagList(), userExtInfo);
                }
                
                lstChildren.addAll(lstEndChildren);
                map.put("item", lstChildren);
            }else{
                if(userExtInfo.getMajorTagID().contains(tagTmp.getId())){
                    map.put("checked", 1);
                    map.put("open", 1);
                }else{
                    map.put("checked", 0);
                    map.put("open", 0);
                }   
            }
            
            listResult.add(map);
        }
        
        mapResult.put("id", 0);
        mapResult.put("item", listResult);

        return mapResult;
    }
    
    private List<Map> permissionListItem(List<MajorTag> lstMajorTag, UserExtInfo userExtInfo){
        
        Map<String,Object> map = null;   
        List<Map> lstChildren =  null; 
        List<Map> lstEndChildren =  null;        
        List<Map> listResult = new ArrayList<>();
               
        for(MajorTag tagTmp : lstMajorTag){
            
            map = new HashMap<String,Object>();  
            map.put("id", tagTmp.getId());
            map.put("text", tagTmp.getName());
            
            // 判断是否存在子集
            if(tagTmp.getChildren().size() > 0 || tagTmp.getEndTagList().size() > 0){
                
                lstChildren =  new ArrayList<>(); 
                lstEndChildren =  new ArrayList<>(); 
                
                // major_tag
                if(tagTmp.getChildren().size() > 0){
                    
                    lstChildren = permissionListItem(tagTmp.getChildren(), userExtInfo);
                }

                // end_tag
                if(tagTmp.getEndTagList().size() > 0){
                    
                    lstEndChildren = permissionListEndItem(tagTmp.getEndTagList(), userExtInfo);
                }
                
                lstChildren.addAll(lstEndChildren);
                map.put("item", lstChildren);
            }else{
                
                if(userExtInfo.getMajorTagID().contains(tagTmp.getId())){
                    map.put("checked", 1);
                    map.put("open", 1);
                }else{
                    map.put("checked", 0);
                    map.put("open", 0);
                }  
            }
            
            listResult.add(map);
        }
        
        return listResult;
    }
    
    private List<Map> permissionListEndItem(List<EndTag> lstEndTag, UserExtInfo userExtInfo){
        
        Map<String,Object> map = null; 
        List<Map> listResult = new ArrayList<>();
               
        for(EndTag tagTmp : lstEndTag){
            
            map = new HashMap<String,Object>();  
            map.put("id", "j_" + tagTmp.getId());
            map.put("text", tagTmp.getName());
            
            if(userExtInfo.getEndTagID().contains(tagTmp.getId())){
                map.put("checked", 1);
                map.put("open", 1);
            }else{
                map.put("checked", 0);
                map.put("open", 0);
            }
            
            listResult.add(map);
        }
        
        return listResult;
    }
    
    @RequestMapping(value="savePermission")
    @ResponseBody
	public String savePermission(@ModelAttribute("preloadUserPermission")UserExtInfo userExtInfo) {

        userExtInfoService.saveUserExtInfo(userExtInfo);
        return "true";
	}
    
    @ModelAttribute("preloadUserPermission")
    public UserExtInfo preloadUserPermission(@RequestParam(value = "userid", required = false) Integer user_id,
        @RequestParam(value = "perList", required = false) String perList){
        if(user_id  != null){
            
            Set<Integer> lstEndTag = new HashSet<Integer>();
            Set<Integer> lstMajorTag = new HashSet<Integer>();
            UserExtInfo userExtInfo = userExtInfoService.findUserExtInfoByUserID(user_id);
            
            String[] strPer = perList.split(",");
            for(String strTmp : strPer){
                
                if(strTmp.startsWith("j_")){
                    
                    lstEndTag.add(Integer.valueOf(strTmp.replaceAll("j_", "")));
                }else{
                    
                    lstMajorTag.add(Integer.valueOf(strTmp));
                }
            }            
            
            userExtInfo.setMajorTagID(lstMajorTag);
            userExtInfo.setEndTagID(lstEndTag);
            return userExtInfo;
        }
        return null;
    }
}
