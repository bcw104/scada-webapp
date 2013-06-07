package com.ht.scada.web.mvc;

import com.ht.scada.common.tag.entity.EndTag;
import com.ht.scada.security.entity.User;
import com.ht.scada.security.service.UserService;
import com.ht.scada.web.entity.AlarmRecord;
import com.ht.scada.web.entity.UserExtInfo;
import com.ht.scada.web.service.AlarmInfoService;
import com.ht.scada.web.service.UserExtInfoService;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/alarm")
public class AlarmInfoController {
    private static final Logger log = LoggerFactory.getLogger(AlarmInfoController.class);
    
    @Autowired
    private AlarmInfoService alarmInfoService;
    @Autowired
	private UserService userService;
    @Autowired
	private UserExtInfoService userExtInfoService;
    
    @RequestMapping(value="history")
	@ResponseBody
    public List<AlarmRecord> history(){
        List<AlarmRecord> list = alarmInfoService.getHistoryAlarmRecord(1);
        List<AlarmRecord> alarmList = new ArrayList<>();
        User user = userService.getCurrentUser();
        UserExtInfo userExtInfo = userExtInfoService.findUserExtInfoByUserID(user.getId());
        Set<Integer> endTagIDs= userExtInfo.getEndTagID();
        for(AlarmRecord rec :list){
            EndTag endTag = rec.getEndTag();
            if(endTagIDs.contains(endTag.getId())){
                alarmList.add(rec);
            }
        }
        return alarmList;
    }
    @RequestMapping(value="realtime")
	@ResponseBody
    public List<AlarmRecord> realtime(){
        List<AlarmRecord> list = alarmInfoService.getHistoryAlarmRecord(0);
        List<AlarmRecord> alarmList = new ArrayList<>();
        User user = userService.getCurrentUser();
        UserExtInfo userExtInfo = userExtInfoService.findUserExtInfoByUserID(user.getId());
        Set<Integer> endTagIDs= userExtInfo.getEndTagID();
        for(AlarmRecord rec :list){
            EndTag endTag = rec.getEndTag();
            if(endTagIDs.contains(endTag.getId())){
                alarmList.add(rec);
            }
        }
        return alarmList;
    }
    @RequestMapping(value="getAlarmById")
	@ResponseBody
    public AlarmRecord getAlarmById(int id){
        return alarmInfoService.getAlarmByID(id);
    }
    
}
