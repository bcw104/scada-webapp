package com.ht.scada.web.mvc;

import com.ht.scada.common.tag.entity.EndTag;
import com.ht.scada.common.tag.entity.EndTagExtInfo;
import com.ht.scada.common.tag.entity.MajorTag;
import com.ht.scada.common.tag.service.EndTagService;
import com.ht.scada.common.tag.service.MajorTagService;
import com.ht.scada.common.tag.type.service.TypeService;
import com.ht.scada.common.tag.util.EndTagTypeEnum;
import com.ht.scada.common.tag.util.VarGroupEnum;
import com.ht.scada.common.tag.util.VarSubTypeEnum;
import com.ht.scada.data.service.RealtimeDataService;
import com.ht.scada.security.entity.User;
import com.ht.scada.security.service.UserService;
import com.ht.scada.web.entity.UserExtInfo;
import com.ht.scada.web.service.UserExtInfoService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 实时监控Controller
 *
 * @author hxy
 */
@Controller
@RequestMapping(value = "/realtime")
public class RealTimeController {
    private static final Logger log = LoggerFactory.getLogger(UserAdminController.class);
    
    @Autowired
	private UserService userService;
    @Autowired
	private UserExtInfoService userExtInfoService;
    @Autowired
    private EndTagService endTagService;
    @Autowired
    private MajorTagService majorTagService;
    @Autowired
    private RealtimeDataService realtimeDataService;
    @Autowired
    private TypeService typeService;
    
    /**
     * 按登录用户权限返回油井信息,返回格式为JSON
     * 
     * @return 当前用户有权限的油井信息
     */
    @RequestMapping(value="youjing")
    @ResponseBody
    public List<Map> youJingList(){
        User user = userService.getCurrentUser();
        UserExtInfo userExtInfo = userExtInfoService.findUserExtInfoByUserID(user.getId());
        Set<Integer> set = userExtInfo.getEndTagID();
        List<Map> list = new ArrayList<>();
        for(int id : set){
            EndTag endTag = endTagService.getById(id);
            if(endTag.getType().equals(EndTagTypeEnum.YOU_JING.toString())){
                HashMap map = new HashMap();
                map.put("id", endTag.getId());
                map.put("code", endTag.getCode());
                map.put("name", endTag.getName());
                map.put("type", endTag.getType());
                map.put("subtype", endTag.getSubType());
                map.put("major_tag_id",endTag.getMajorTag().getId());
                map.put("state",realtimeDataService.getEndTagVarInfo(endTag.getCode(), VarSubTypeEnum.QI_TING_ZHUANG_TAI.toString()));
                list.add(map);
            }
        }
        return list;
    }
    
    /**
     * 按登录用户权限返回机构信息,返回格式为JSON
     * 
     * @return 当前用户有权限的机构信息
     */
    @RequestMapping(value="majortag")
    @ResponseBody
    public List<Map> majorTagList(){
        User user = userService.getCurrentUser();
        UserExtInfo userExtInfo = userExtInfoService.findUserExtInfoByUserID(user.getId());
        Set<Integer> set = userExtInfo.getMajorTagID();
        List<Map> list = new ArrayList<>();
        for(int id : set){
            MajorTag majorTag = majorTagService.getById(id);
            HashMap map = new HashMap();
            map.put("id", majorTag.getId());
            map.put("name", majorTag.getName());
            map.put("type", majorTag.getType());
            MajorTag ptag = majorTag.getParent();
            if(ptag == null){
                map.put("pid", 0);
            }else{
                map.put("pid",ptag.getId());
            }
            
            list.add(map);
        }
        return list;
    }
    
    /**
     * 按登录用户权限返回增压站信息,返回格式为JSON
     * 
     * @return 当前用户有权限的增压站信息
     */
    @RequestMapping(value="zengya")
    @ResponseBody
    public List<Map> zengyaList(){
        User user = userService.getCurrentUser();
        UserExtInfo userExtInfo = userExtInfoService.findUserExtInfoByUserID(user.getId());
        Set<Integer> set = userExtInfo.getEndTagID();
        List<Map> list = new ArrayList<>();
        for(int id : set){
            EndTag endTag = endTagService.getById(id);
            if(endTag.getType().equals(EndTagTypeEnum.ZENG_YA_ZHAN.toString())){
                HashMap map = new HashMap();
                map.put("id", endTag.getId());
                map.put("code", endTag.getCode());
                map.put("name", endTag.getName());
                map.put("type", endTag.getType());
                map.put("major_tag_id",endTag.getMajorTag().getId());
                map.putAll(realtimeDataService.getEndTagVarGroupInfo(endTag.getCode(), VarGroupEnum.ZYZ_YC.toString()));
                list.add(map);
            }
        }
        return list;
    }
    
    /**
     * 按登录用户权限返回注水站信息,返回格式为JSON
     * 
     * @return 当前用户有权限的注水站信息
     */
    @RequestMapping(value="zhushuizhan")
    @ResponseBody
    public List<Map> zhushuizhan(){
        User user = userService.getCurrentUser();
        UserExtInfo userExtInfo = userExtInfoService.findUserExtInfoByUserID(user.getId());
        Set<Integer> set = userExtInfo.getEndTagID();
        List<Map> list = new ArrayList<>();
        for(int id : set){
            EndTag endTag = endTagService.getById(id);
            if(endTag.getType().equals(EndTagTypeEnum.ZHU_SHUI_ZHAN.toString())){
                HashMap map = new HashMap();
                map.put("id", endTag.getId());
                map.put("code", endTag.getCode());
                map.put("name", endTag.getName());
                map.put("type", endTag.getType());
                map.put("major_tag_id",endTag.getMajorTag().getId());
                map.putAll(realtimeDataService.getEndTagVarGroupInfo(endTag.getCode(), VarGroupEnum.ZSZ_YC.toString()));
                list.add(map);
            }
        }
        return list;
    }
    /**
     * 按登录用户权限返回接转站信息,返回格式为JSON
     * 
     * @return 当前用户有权限的接转站信息
     */
    @RequestMapping(value="jiezhuanzhan")
    @ResponseBody
    public List<Map> jiezhuanzhan(){
        User user = userService.getCurrentUser();
        UserExtInfo userExtInfo = userExtInfoService.findUserExtInfoByUserID(user.getId());
        Set<Integer> set = userExtInfo.getEndTagID();
        List<Map> list = new ArrayList<>();
        for(int id : set){
            EndTag endTag = endTagService.getById(id);
            if(endTag.getType().equals(EndTagTypeEnum.JIE_ZHUAN_ZHAN.toString())){
                HashMap map = new HashMap();
                map.put("id", endTag.getId());
                map.put("code", endTag.getCode());
                map.put("name", endTag.getName());
                map.put("type", endTag.getType());
                map.put("major_tag_id",endTag.getMajorTag().getId());
                map.putAll(realtimeDataService.getEndTagVarGroupInfo(endTag.getCode(), VarGroupEnum.JZZ_YC.toString()));
                list.add(map);
            }
        }
        return list;
    }
    
    @RequestMapping(value="etinfo")
    @ResponseBody
    public Map endTagExtInfo(String code){
        EndTag endTag = endTagService.getByCode(code);
        Map<String,String> map = new HashMap();
        for(EndTagExtInfo info : endTag.getExtInfo()){
            map.put(info.getName(), info.getValue());
        }
        return map;
    }
    @RequestMapping(value="rtu")
    @ResponseBody
    public Map rtu(String code){
        Map rtn = new HashMap<>();
        Map<String,String> map = realtimeDataService.getEndTagVarGroupInfo(code, VarGroupEnum.RTU_ZHUANG_TAI.toString());
        for(Map.Entry<String,String> entry : map.entrySet()){
            
        }
        return null;
    }
}
