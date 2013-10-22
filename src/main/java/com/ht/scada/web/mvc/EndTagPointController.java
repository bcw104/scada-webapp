package com.ht.scada.web.mvc;

import com.ht.scada.common.tag.entity.EndTag;
import com.ht.scada.common.tag.entity.EndTagExtInfo;
import com.ht.scada.common.tag.service.EndTagService;
import com.ht.scada.common.tag.util.EndTagExtNameEnum;
import com.ht.scada.common.tag.util.VarSubTypeEnum;
import com.ht.scada.data.service.RealtimeDataService;
import com.ht.scada.security.entity.User;
import com.ht.scada.security.service.UserService;
import com.ht.scada.web.entity.EndTagPoint;
import com.ht.scada.web.entity.UserExtInfo;
import com.ht.scada.web.service.EndTagPointService;
import com.ht.scada.web.service.UserExtInfoService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 最终设备（井）Controller
 * @author Administrator
 */
@Controller
@RequestMapping("/endtagpoint")
public class EndTagPointController {
    @Autowired
    private UserService userService;
    @Autowired
    private EndTagPointService endTagPointService;
    @Autowired
    private EndTagService endTagService;
    @Autowired
    private UserExtInfoService userExtInfoService;
    @Autowired
    private RealtimeDataService realtimeDataService;
    
    /**
     * 获得数据列表
     * @return 
     */
    @RequestMapping(value = "list")
    @ResponseBody
    public List<Map> list(){
        User user = userService.getCurrentUser();
        UserExtInfo userEx = userExtInfoService.findUserExtInfoByUserID(user.getId());
        List<EndTagPoint> list = endTagPointService.getPointListByIDS(userEx.getEndTagID());
        List<Map> rtn = new ArrayList<>();
        for(EndTagPoint point:list){
            Map map = new HashMap();
            map.put("id", point.getEndTag().getId());
            map.put("code", point.getEndTag().getCode());
            map.put("name", point.getEndTag().getName());
            map.put("x", point.getX());
            map.put("y", point.getY());
            map.put("type", point.getEndTag().getType());
            map.put("sub_type", point.getEndTag().getSubType());
            map.put("state",realtimeDataService.getEndTagVarInfo(point.getEndTag().getCode(), VarSubTypeEnum.QI_TING_ZHUANG_TAI.toString().toLowerCase()));
            List<EndTagExtInfo> extList = point.getEndTag().getExtInfo();
            for(EndTagExtInfo ext : extList){
                if(ext.getKeyName().equals(EndTagExtNameEnum.STAGE.toString())){
                    map.put("stage", ext.getValue());
                    break;
                }
            }
            rtn.add(map);
        }
        return rtn;
    }
    
    /**
     * 获得井坐标
     * @param id
     * @return 
     */
    @RequestMapping(value = "point")
    @ResponseBody
    public EndTagPoint getEndTagPoint(int id){
        return endTagPointService.getPointListByEndTagID(id);
    }
    
    /**
     * 保存井坐标信息
     * @param id
     * @param pointx
     * @param pointy
     * @param endtagid
     * @return 
     */
    @RequestMapping(value = "savepoint")
    @ResponseBody
    public int savepoint(int id,String pointx,String pointy,int endtagid){
        EndTagPoint endTagPoint;
        try{
            endTagPoint = endTagPointService.getPointListByEndTagID(endtagid);
            if(endTagPoint == null){
                endTagPoint = new EndTagPoint();
                EndTag endTag = endTagService.getById(endtagid);
                endTagPoint.setEndTag(endTag);
            }
            endTagPoint.setX(pointx);
            endTagPoint.setY(pointy);
            endTagPointService.savePoint(endTagPoint);
        }catch(Exception e){
            return 0;
        }
        return 1;
    }
}
