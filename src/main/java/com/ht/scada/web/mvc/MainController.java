package com.ht.scada.web.mvc;

import com.ht.scada.common.tag.entity.EndTag;
import com.ht.scada.common.tag.entity.TagCfgTpl;
import com.ht.scada.common.tag.entity.VarGroupCfg;
import com.ht.scada.common.tag.service.EndTagService;
import com.ht.scada.common.tag.service.TagService;
import com.ht.scada.common.tag.service.VarGroupCfgService;
import com.ht.scada.data.service.RealtimeDataService;
import com.ht.scada.security.entity.User;
import com.ht.scada.security.entity.UserRole;
import com.ht.scada.security.service.UserService;

import java.util.*;

import com.ht.scada.web.show.util.Temp;
import com.ht.scada.web.show.util.TempWrapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 生产监控模块Controller
 * @author Administrator
 */
@Controller
@RequestMapping(value = "/main")
public class MainController {
	private static final Logger log = LoggerFactory.getLogger(RegisterController.class);
	@Autowired
	private UserService userService;
    @Autowired
    private EndTagService endTagService;
    @Autowired
    private RealtimeDataService realtimeDataService;
    @Autowired
    private VarGroupCfgService varGroupCfgService;
    @Autowired
    private TagService tagService;
	
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
    
    /**
     * 进入抽油井信息页面
     * @param id
     * @param model
     * @return 
     */
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
    
    /**
     * 进入电潜泵信息页面
     * @param id
     * @param model
     * @return 
     */
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
    
    /**
     * 进入自喷井信息页面
     * @param id
     * @param model
     * @return 
     */
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
    
    /**
     * 进入焖井信息页面
     * @param id
     * @param model
     * @return 
     */
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
    
    /**
     * 进入螺杆泵信息页面
     * @param id
     * @param model
     * @return 
     */
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
    
    /**
     * 进入自喷井信息页面
     * @param id
     * @param model
     * @return 
     */
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
    
    /**
     * 进入孤立井信息页面
     * @param id
     * @param model
     * @return 
     */
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
    
    /**
     * 测试用登录（可忽略不记）
     * @param redirectAttributes
     * @return 
     */
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
    
    /**
     * 登录监测接口
     * @return 
     */
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

    /**
     * 进入演示页面
     *
     * @return
     */
    @RequestMapping(value = "show")
    public String show(Model model) {
        // 获得所有油井
        List<EndTag> endTagLists = endTagService.getAllEndTag();

        model.addAttribute("endTagList", endTagLists);
        return "main/show";
    }

    @RequestMapping(value = "detail")
    public String groupInfo(String code, Model model) {
        EndTag endTag = endTagService.getByCode(code);

        // 油井的所有实时数据
        Map<String, String> varValueMap = realtimeDataService.getEndTagAllVarValue(code);
        varValueMap.put("wei_yi_array", realtimeDataService.getEndTagVarYcArray(code, "wei_yi_array"));
        varValueMap.put("zai_he_array", realtimeDataService.getEndTagVarYcArray(code, "zai_he_array"));
        varValueMap.put("dian_liu_array", realtimeDataService.getEndTagVarYcArray(code, "dian_liu_array"));
        varValueMap.put("gong_lv_array", realtimeDataService.getEndTagVarYcArray(code, "gong_lv_array"));
        varValueMap.put("gong_lv_yin_shu_array", realtimeDataService.getEndTagVarYcArray(code, "gong_lv_yin_shu_array"));
        varValueMap.put("xb_ua_array", realtimeDataService.getEndTagVarYcArray(code, "xb_ua_array"));
        varValueMap.put("xb_ub_array", realtimeDataService.getEndTagVarYcArray(code, "xb_ub_array"));
        varValueMap.put("xb_uc_array", realtimeDataService.getEndTagVarYcArray(code, "xb_uc_array"));
        varValueMap.put("xb_ia_array", realtimeDataService.getEndTagVarYcArray(code, "xb_ia_array"));
        varValueMap.put("xb_ib_array", realtimeDataService.getEndTagVarYcArray(code, "xb_ib_array"));
        varValueMap.put("xb_ic_array", realtimeDataService.getEndTagVarYcArray(code, "xb_ic_array"));

        // 临时存储
        List<Temp> temps = new ArrayList<>();

        // 获得所有变量分组
        List<VarGroupCfg> varGroupCfgLists = varGroupCfgService.getAllVarGroupCfg();

        List<TempWrapper> tempWrapperList = new ArrayList<>();

        for (Map.Entry<String, String> entry : varValueMap.entrySet()) {

            // 變量模板
            // TODO 这个地方查询比较费时
            TagCfgTpl cfgtpl = tagService.getTagCfgTplByCodeAndVarName(code, entry.getKey());

            // 变量分组名称
            String varGroupName = "";
            // 变量分组类型
            String varGroupType = "";

            if (cfgtpl != null) {
                // 变量分组名称
                varGroupName = cfgtpl.getVarGroup();
                // 变量分组类型
                varGroupType = cfgtpl.getVarType();
            }

            Temp temp = new Temp(varGroupName, varGroupType, cfgtpl.getTagName(), entry.getValue());
            temps.add(temp);
        }

        for (VarGroupCfg cgf : varGroupCfgLists) {

            // 遥测、遥脉、遥信、其他变量分组
            List<Temp> tempYcList = new ArrayList<>();
            List<Temp> tempYmList = new ArrayList<>();
            List<Temp> tempYxList = new ArrayList<>();
            List<Temp> tempQtList = new ArrayList<>();

            for (Temp temp : temps) {
                String varGroupName = temp.getVarGroupName();
                if (varGroupName.equals(cgf.getName())) {
                    if (temp.getVarGroupType().equals("YC")) {
                        tempYcList.add(temp);
                    } else if (temp.getVarGroupType().equals("YM")) {
                        tempYmList.add(temp);
                    } else if (temp.getVarGroupType().equals("YX")) {
                        tempYxList.add(temp);
                    } else if (temp.getVarGroupType().equals("QT")) {
                        tempQtList.add(temp);
                    }
                }
            }

            // 无数据的变量分组不显示
            if (!(tempQtList.size() == 0 && tempYcList.size() == 0 && tempYmList.size() == 0 && tempYxList.size() == 0)) {
                TempWrapper tempWrapper = new TempWrapper(cgf.getValue(), tempYcList, tempYmList, tempYxList, tempQtList);
                tempWrapperList.add(tempWrapper);
            }
        }

        model.addAttribute("endTag", endTag);
        model.addAttribute("tempWrapperList", tempWrapperList);

        return "main/detail";
    }
    /**
     * 进入变频器曲线显示页面
     *
     * @return
     */
    @RequestMapping(value = "power")
    public String power(String code, Model model) {
        model.addAttribute("code", code);
        return "main/power";
    }

}
