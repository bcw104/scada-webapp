/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ht.scada.web.dao;

import com.ht.scada.web.entity.AlarmHandle;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author admin
 */
public interface AlarmHandleDao extends JpaRepository<AlarmHandle,Integer>{
	public List<AlarmHandle> findByAlarmRecord(String alarmRecord);
}
