package com.ht.scada.web.service.impl;

import com.ht.scada.common.tag.entity.EndTag;
import com.ht.scada.common.tag.service.EndTagService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ht.scada.data.RealtimeMessageListener;
import com.ht.scada.data.entity.FaultRecord;
import com.ht.scada.data.entity.OffLimitsRecord;
import com.ht.scada.data.entity.YxRecord;
import com.ht.scada.oildata.OilDataMessageListener;
import com.ht.scada.oildata.entity.FaultDiagnoseRecord;
import com.ht.scada.security.entity.User;
import com.ht.scada.web.entity.AlarmRecord;
import com.ht.scada.web.entity.UserExtInfo;
import com.ht.scada.web.service.AlarmInfoService;
import com.ht.scada.web.service.UserExtInfoService;
import java.util.List;
import javax.inject.Inject;
import org.atmosphere.cpr.MetaBroadcaster;


public class RealtimeMessageImpl implements RealtimeMessageListener,OilDataMessageListener {
	
	private static final Logger log = LoggerFactory.getLogger(RealtimeMessageImpl.class);
	private static final String ALARM_FAULT = "ALARM_FAULT";
    private static final String ALARM_OFFLIMITS = "ALARM_OFFLIMITS";
    private static final String ALARM_YXCHANGED = "ALARM_YXCHANGED";
    private static final String ALARM_FAULTDIAGNOSE = "ALARM_FAULTDIAGNOSE";
    
    
    private static final int ALARM_STATUS_OCCURED = 0;
    private static final int ALARM_STATUS_RESUMED = 1;
    
    @Inject
    private EndTagService endTagService;
    @Inject
    private AlarmInfoService alarmInfoService;
    @Inject
    private UserExtInfoService userExtInfoService;
    
	@Override
	public void faultOccured(FaultRecord record) {
        log.info("接收报警信息——faultOccured");
        AlarmRecord alarm = new AlarmRecord();
        alarm.setAlarmType(ALARM_FAULT);
        alarm.setAlarmId(record.getId());
        EndTag endTag = endTagService.getByCode(record.getCode());
        alarm.setEndTag(endTag);
        alarm.setActionTime(record.getActionTime());
		alarm.setInfo(record.getInfo());
        alarm.setVarName(record.getName());
        alarm.setRemark(record.getInfo());
        alarmInfoService.saveAlarmRecord(alarm);
        pushAlarm(alarm);
	}

	@Override
	public void faultResumed(FaultRecord record) {
		// TODO Auto-generated method stub
		log.info("报警信息解除--faultResumed");
        AlarmRecord alarm = alarmInfoService.getAlarmByAlarmId(record.getId());
        alarm.setResumeTime(record.getResumeTime());
        alarm.setStatus(ALARM_STATUS_RESUMED);
        alarmInfoService.saveAlarmRecord(alarm);
        pushAlarm(alarm);
	}

	@Override
	public void offLimitsOccured(OffLimitsRecord record) {
		// TODO Auto-generated method stub
		log.info("接收报警信息——offLimitsOccured");
        AlarmRecord alarm = new AlarmRecord();
        alarm.setAlarmType(ALARM_OFFLIMITS);
        alarm.setAlarmId(record.getId());
        EndTag endTag = endTagService.getByCode(record.getCode());
        alarm.setEndTag(endTag);
        alarm.setActionTime(record.getActionTime());
		alarm.setInfo(record.getInfo());
        alarm.setVarName(record.getName());
        alarm.setRemark(record.getInfo());
        alarmInfoService.saveAlarmRecord(alarm);
        pushAlarm(alarm);
	}

	@Override
	public void offLimitsResumed(OffLimitsRecord record) {
		// TODO Auto-generated method stub
		log.info("报警信息解除——offLimitsResumed");
        AlarmRecord alarm = alarmInfoService.getAlarmByAlarmId(record.getId());
        alarm.setResumeTime(record.getResumeTime());
        alarm.setStatus(ALARM_STATUS_RESUMED);
        alarmInfoService.saveAlarmRecord(alarm);
        pushAlarm(alarm);
	}

	@Override
	public void yxChanged(YxRecord record) {
		// TODO Auto-generated method stub
		log.info("接收报警信息——yxChanged");
        //ALARM_YXCHANGED
        AlarmRecord alarm = new AlarmRecord();
        alarm.setAlarmType(ALARM_YXCHANGED);
        alarm.setAlarmId(record.getId());
        EndTag endTag = endTagService.getByCode(record.getCode());
        alarm.setEndTag(endTag);
        alarm.setActionTime(record.getDatetime());
        alarm.setResumeTime(record.getDatetime());
        alarm.setStatus(ALARM_STATUS_RESUMED);
		alarm.setInfo(record.getInfo());
        alarm.setVarName(record.getName());
        alarm.setRemark(record.getInfo());
        alarmInfoService.saveAlarmRecord(alarm);
        pushAlarm(alarm);
	}

    private void pushAlarm(AlarmRecord alarm){
        List<UserExtInfo> list = userExtInfoService.getUserExtInfoByEndTag(alarm.getEndTag().getId());
        for(UserExtInfo extInfo:list){
            if(extInfo.getHeadflg() == "1"){
                User user = extInfo.getUser();
                MetaBroadcaster.getDefault().broadcastTo("/" + user.getUsername(), alarm.getId().toString());
            }
        }
    }

    @Override
    public void faultOccured(FaultDiagnoseRecord record) {
        AlarmRecord alarm = new AlarmRecord();
        alarm.setAlarmType(ALARM_FAULTDIAGNOSE);
        alarm.setAlarmId(record.getId());
        EndTag endTag = endTagService.getByCode(record.getCode());
        alarm.setEndTag(endTag);
        alarm.setActionTime(record.getActionTime());
		alarm.setInfo(record.getInfo());
        alarm.setVarName(record.getName());
        alarm.setRemark(record.getInfo());
        alarmInfoService.saveAlarmRecord(alarm);
        pushAlarm(alarm);
    }

    @Override
    public void faultResumed(FaultDiagnoseRecord record) {
        AlarmRecord alarm = alarmInfoService.getAlarmByAlarmId(record.getId());
        alarm.setResumeTime(record.getResumeTime());
        alarm.setStatus(ALARM_STATUS_RESUMED);
        alarmInfoService.saveAlarmRecord(alarm);
        pushAlarm(alarm);
    }
}
