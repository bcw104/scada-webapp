package com.ht.scada.web.mvc;

import com.ht.scada.common.tag.entity.EndTag;
import com.ht.scada.common.tag.entity.MajorTag;
import com.ht.scada.common.tag.service.EndTagService;
import com.ht.scada.common.tag.service.MajorTagService;
import com.ht.scada.security.entity.UserRole;
import com.ht.scada.web.service.MenuService;
import com.ht.scada.security.service.UserService;
import com.ht.scada.web.entity.UserExtInfo;
import java.util.ArrayList;
import java.util.HashMap;
import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 地图坐标Controller
 *
 * @author hxy
 */
@Controller
@RequestMapping(value = "/admin/map")
public class UserMapController {
    private static final Logger log = LoggerFactory.getLogger(UserAdminController.class);
    @Autowired
	private MajorTagService majorTagService;
    @Autowired
	private EndTagService endTagService;
    @RequestMapping(method = RequestMethod.GET)
    public String index(){
        return "account/mapUpdat";
    }
    @RequestMapping(value="mapList")
    @ResponseBody
     public Map<String,Object> permissionList(){
        
        Map<String,Object> map = null; 
        List<Map> lstChildren =  null; 
        List<Map> lstEndChildren =  null;        
        
        List<Map> listResult = new ArrayList<>();
        Map<String,Object> mapResult = new HashMap<String,Object>();  

        List<MajorTag> lstMajorTag = majorTagService.getRootMajorTag();
//        List<EndTag> lstEndTag = endTagService.getRootMajorTag();
//        UserExtInfo userExtInfo = userExtInfoService.findUserExtInfoByUserID(id);
                        
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
                    
                    lstChildren = permissionListItem(tagTmp.getChildren());
                }

                // end_tag
                if(tagTmp.getEndTagList().size() > 0){
                    
                    lstEndChildren = permissionListEndItem(tagTmp.getEndTagList());
                }
                
                lstChildren.addAll(lstEndChildren);
                map.put("item", lstChildren);
            }
            
            listResult.add(map);
        }
        mapResult.put("id", 0);
        mapResult.put("item", listResult);
        return mapResult;
    }
     private List<Map> permissionListItem(List<MajorTag> lstMajorTag){
        
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
                    
                    lstChildren = permissionListItem(tagTmp.getChildren());
                }

                // end_tag
                if(tagTmp.getEndTagList().size() > 0){
                    
                    lstEndChildren = permissionListEndItem(tagTmp.getEndTagList());
                }
                
                lstChildren.addAll(lstEndChildren);
                map.put("item", lstChildren);
            }
            
            listResult.add(map);
        }
        
        return listResult;
    }
    
    private List<Map> permissionListEndItem(List<EndTag> lstEndTag){
        
        Map<String,Object> map = null; 
        List<Map> listResult = new ArrayList<>();
               
        for(EndTag tagTmp : lstEndTag){
            
            map = new HashMap<String,Object>();  
            map.put("id", "j_" + tagTmp.getId());
            map.put("text", tagTmp.getName());
            
            listResult.add(map);
        }
        
        return listResult;
    }
    
}
