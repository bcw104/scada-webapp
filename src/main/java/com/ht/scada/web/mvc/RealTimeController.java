package com.ht.scada.web.mvc;

import com.ht.scada.common.tag.entity.EndTag;
import com.ht.scada.common.tag.entity.MajorTag;
import com.ht.scada.common.tag.service.EndTagService;
import com.ht.scada.common.tag.service.MajorTagService;
import com.ht.scada.common.tag.util.EndTagTypeEnum;
import com.ht.scada.common.tag.util.VarSubTypeEnum;
import com.ht.scada.data.service.RealtimeDataService;
import com.ht.scada.security.entity.User;
import com.ht.scada.security.service.UserService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    private EndTagService endTagService;
    @Autowired
    private MajorTagService majorTagService;
    @Autowired
    private RealtimeDataService realtimeDataService;
    
    @RequestMapping(value="youjing")
    @ResponseBody
    public List<Map> youJingList(Model model){
        User user = userService.getCurrentUser();
        Set<Integer> set = user.getEndTagID();
        List<Map> list = new ArrayList<>();
        for(int id : set){
            EndTag endTag = endTagService.getById(id);
            //if(endTag.getType().equals("YOU_JING")){
            if(endTag.getType().equals(EndTagTypeEnum.YOU_JING.toString())){
                HashMap map = new HashMap();
                map.put("id", endTag.getId());
                map.put("code", endTag.getCode());
                map.put("name", endTag.getName());
                map.put("type", endTag.getType());
                map.put("subtype", endTag.getSubType());
                map.put("major_tag_id",endTag.getMajorTag().getId());
                //map.put("state",realtimeDataService.getEndTagVarInfo(endTag.getCode(), "QI_QING_ZHUANG_TAI"));
                map.put("state",realtimeDataService.getEndTagVarInfo(endTag.getCode(), VarSubTypeEnum.QI_TING_ZHUANG_TAI.toString()));
                //map.put("state","1");
                list.add(map);
            }
        }
        return list;
    }
    @RequestMapping(value="majortag")
    @ResponseBody
    public List<Map> majorTagList(Model model){
        User user = userService.getCurrentUser();
        Set<Integer> set = user.getMajorTagID();
        List<Map> list = new ArrayList<>();
        for(int id : set){
            MajorTag endTag = majorTagService.getById(id);
            HashMap map = new HashMap();
            map.put("id", endTag.getId());
            map.put("name", endTag.getName());
            map.put("type", endTag.getType());
            list.add(map);
        }
        return list;
    }
    @RequestMapping(value="zengya")
    @ResponseBody
    public List<Map> zengyaList(Model model){
        User user = userService.getCurrentUser();
        Set<Integer> set = user.getEndTagID();
        List<Map> list = new ArrayList<>();
        for(int id : set){
            EndTag endTag = endTagService.getById(id);
            //if(endTag.getType().equals("ZENG_YA_ZHAN")){
            if(endTag.getType().equals(EndTagTypeEnum.ZENG_YA_ZHAN.toString())){
                HashMap map = new HashMap();
                map.put("id", endTag.getId());
                map.put("code", endTag.getCode());
                map.put("name", endTag.getName());
                map.put("type", endTag.getType());
                map.put("major_tag_id",endTag.getMajorTag().getId());
                //map.put("state",realtimeDataService.getEndTagVarInfo(endTag.getCode(), "YOU_JING", "QI_QING_ZHUANG_TAI"));
                //map.put("state","1");
                list.add(map);
            }
        }
        return list;
    }
}
