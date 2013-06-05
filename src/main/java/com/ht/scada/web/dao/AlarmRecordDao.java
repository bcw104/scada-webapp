package com.ht.scada.web.dao;

import com.ht.scada.web.entity.AlarmRecord;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;


public interface AlarmRecordDao extends JpaRepository<AlarmRecord,Integer>{
    public List<AlarmRecord> findByStatus(int status);
    public AlarmRecord findByAlarmId(String alarmId);
}
