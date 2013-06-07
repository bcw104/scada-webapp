package com.ht.scada.web.service.impl;

import com.ht.scada.common.tag.entity.EndTag;
import com.ht.scada.common.tag.service.EndTagService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ht.scada.data.RealtimeMessageListener;
import com.ht.scada.data.entity.FaultRecord;
import com.ht.scada.data.entity.OffLimitsRecord;
import com.ht.scada.data.entity.YxRecord;
import com.ht.scada.security.entity.User;
import com.ht.scada.web.entity.AlarmRecord;
import com.ht.scada.web.entity.UserExtInfo;
import com.ht.scada.web.service.AlarmInfoService;
import com.ht.scada.web.service.UserExtInfoService;
import java.util.List;
import javax.inject.Inject;
import net.sf.json.JSONSerializer;
import org.atmosphere.cpr.MetaBroadcaster;


public class RealtimeMessageImpl implements RealtimeMessageListener {
	
	private static final Logger log = LoggerFactory.getLogger(RealtimeMessageImpl.class);
	private static final String ALARM_FAULT = "ALARM_FAULT";
    
    @Inject
    private EndTagService endTagService;
    @Inject
    private AlarmInfoService alarmInfoService;
    @Inject
    private UserExtInfoService userExtInfoService;
    
	@Override
	public void faultOccured(FaultRecord record) {
        log.info("接收报警信息——faultOccured");
        
        /*AlarmRecord alarm = new AlarmRecord();
        alarm.setAlarmType(ALARM_FAULT);
        alarm.setAlarmId(record.getId());
        EndTag endTag = endTagService.getByCode(record.getCode());
        alarm.setEndTag(endTag);
        alarm.setActionTime(record.getActionTime());
		alarm.setInfo(record.getInfo());
        alarm.setVarName(record.getName());
        alarm.setRemark(record.getInfo());
        
        alarmInfoService.saveAlarmRecord(alarm);
        */
        
        this.pushAlarm(alarmInfoService.getAlarmByID(1));
	}

	@Override
	public void faultResumed(FaultRecord record) {
		// TODO Auto-generated method stub
		log.info("报警信息解除--faultResumed");
	}

	@Override
	public void offLimitsOccured(OffLimitsRecord record) {
		// TODO Auto-generated method stub
		log.info("接收报警信息——offLimitsOccured");
	}

	@Override
	public void offLimitsResumed(OffLimitsRecord record) {
		// TODO Auto-generated method stub
		log.info("报警信息解除——offLimitsResumed");
	}

	@Override
	public void yxChanged(YxRecord record) {
		// TODO Auto-generated method stub
		log.info("接收报警信息——yxChanged");
	}

    private void pushAlarm(AlarmRecord alarm){
        //JSONSerializer jsonSerializer = new JSONSerializer();
        List<UserExtInfo> list = userExtInfoService.getUserExtInfoByEndTag(alarm.getEndTag().getId());
        for(UserExtInfo extInfo:list){
            User user = extInfo.getUser();
            try{
                log.debug(JSONSerializer.toJSON(alarm).toString());
            }catch(Exception ex){
                log.debug("json error");
                log.debug("=========================================================================================");
                log.debug(ex.getMessage());
                log.debug("=========================================================================================");
            }
            MetaBroadcaster.getDefault().broadcastTo("/" + user.getUsername(), alarm.getId().toString());
        }
        //MetaBroadcaster.getDefault().broadcastTo("/admin", "aaa");
    }
}
