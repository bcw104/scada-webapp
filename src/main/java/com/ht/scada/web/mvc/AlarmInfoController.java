package com.ht.scada.web.mvc;

import com.ht.scada.common.tag.entity.EndTag;
import com.ht.scada.common.tag.entity.EndTagExtInfo;
import com.ht.scada.common.tag.service.EndTagService;
import com.ht.scada.common.tag.util.EndTagExtNameEnum;
import com.ht.scada.security.entity.User;
import com.ht.scada.security.service.UserService;
import com.ht.scada.web.entity.AlarmHandle;
import com.ht.scada.web.entity.AlarmRecord;
import com.ht.scada.web.entity.UserExtInfo;
import com.ht.scada.web.service.AlarmInfoService;
import com.ht.scada.web.service.UserExtInfoService;
import java.util.ArrayList;
import java.util.Date;
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

@Controller
@RequestMapping("/alarm")
public class AlarmInfoController {
    private static final Logger log = LoggerFactory.getLogger(AlarmInfoController.class);
    private static final String STR_CONFIRM = "confirm";
    private static final String STR_HANDLE = "handle";
    
    @Autowired
    private AlarmInfoService alarmInfoService;
    @Autowired
	private UserService userService;
    @Autowired
	private UserExtInfoService userExtInfoService;
    @Autowired
    private EndTagService endTagService;
    
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
    public Map<String,List>  realtime(){
        List<AlarmRecord> list = alarmInfoService.getHistoryAlarmRecord(0);
        List<AlarmRecord> alarmList = new ArrayList<>();
        Map<String,List> map = new HashMap<>();
        User user = userService.getCurrentUser();
        UserExtInfo userExtInfo = userExtInfoService.findUserExtInfoByUserID(user.getId());
        Set<Integer> endTagIDs= userExtInfo.getEndTagID();
        for(AlarmRecord rec :list){
            EndTag endTag = rec.getEndTag();
            if(endTagIDs.contains(endTag.getId())){
                //按井分类,增加到列表
                List<AlarmRecord> tmplist;
                if(map.containsKey(endTag.getCode())){
                    tmplist = map.get(endTag.getCode());
                }else{
                    tmplist = new ArrayList<>();
                    map.put(endTag.getCode(), tmplist);
                }
                tmplist.add(rec);
            }
        }

        return map;
    }
    @RequestMapping(value="getAlarmById")
	@ResponseBody
    public AlarmRecord getAlarmById(int id){
        return alarmInfoService.getAlarmByID(id);
    }
    @RequestMapping(value="confirm")
    @ResponseBody
    public boolean confirm(int alarmId,String user,String type){
        AlarmRecord alarm = alarmInfoService.getAlarmByID(alarmId);
        Date curDate = new Date();
        AlarmHandle record = null;
        for(AlarmHandle rec:alarm.getAlarmHandleList()){
            if(rec.getUser().getUsername().equals(user)){
                record = rec;
            }
        }
        if(record == null){
            record = new AlarmHandle();
            User usr = userService.getUserByUsername(user);
            record.setUser(usr);
            record.setAlarmRecord(alarm);
            //alarm.getAlarmHandleList().add(record);
        }
        if(type.equals(STR_CONFIRM)){
            //报警回复
            record.setConfirmTime(curDate);
            alarmInfoService.saveAlarmHandle(record);
        }else if(type.equals(STR_HANDLE)){
            //报警处理
            record.setHandleTime(curDate);
            alarmInfoService.saveAlarmHandle(record);
        }else{
            return false;
        }
        return true;
    }
    @RequestMapping(value="now")
    @ResponseBody
    public Date now(){
        return new Date();
    }
    @RequestMapping(value="endTagExtInfo")
    @ResponseBody
    public Map<String,String> endTagExtInfo(String code){
        Map<String,String> map =new HashMap<>();
        EndTag endTag = endTagService.getByCode(code);
        List<EndTagExtInfo> extList = endTag.getExtInfo();
        for(EndTagExtInfo ext : extList){
            map.put(ext.getKeyName(), ext.getValue());
        }
        return map;
    }
}
