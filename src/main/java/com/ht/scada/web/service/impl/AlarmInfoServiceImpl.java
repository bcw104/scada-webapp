package com.ht.scada.web.service.impl;

import com.ht.scada.web.dao.AlarmHandleDao;
import com.ht.scada.web.dao.AlarmRecordDao;
import com.ht.scada.web.entity.AlarmHandle;
import com.ht.scada.web.entity.AlarmRecord;
import com.ht.scada.web.service.AlarmInfoService;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;

@Service
public class AlarmInfoServiceImpl implements AlarmInfoService{
    @Inject
    private AlarmRecordDao alarmRecordDao;
    @Inject
    private AlarmHandleDao alarmHandleDao;
    
    @Override
    public List<AlarmRecord> getHistoryAlarmRecord(int status){
        return alarmRecordDao.findByStatus(status);
    }
    @Override
    public void saveAlarmRecord(AlarmRecord alarmRecord){
        alarmRecordDao.save(alarmRecord);
    }
    @Override
    public AlarmRecord getAlarmByID(int id){
        return alarmRecordDao.findOne(id);
    }
    @Override
    public AlarmRecord getAlarmByAlarmId(String alarmId){
        return alarmRecordDao.findByAlarmId(alarmId);
    }
    
    @Override
    public AlarmHandle saveAlarmHandle(AlarmHandle alarmHandle){
        return alarmHandleDao.save(alarmHandle);
    }
}
