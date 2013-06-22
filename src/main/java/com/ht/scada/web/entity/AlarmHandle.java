package com.ht.scada.web.entity;

import com.alibaba.fastjson.annotation.JSONField;
import com.ht.scada.security.entity.User;
import org.springframework.data.jpa.domain.AbstractPersistable;

import javax.persistence.*;
import java.util.Date;
@Entity
@Table(name="T_Alarm_Handle")
public class AlarmHandle extends AbstractPersistable<Integer>{
	

	private static final long serialVersionUID = -2859120770870449926L;

	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="user_id")
	private User user;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="alarmrecord_id")
	private AlarmRecord alarmRecord;
	
	@Column(name = "confirm_time")
    @Temporal(TemporalType.TIMESTAMP)
	private Date confirmTime;	//确定时间
    @Column(name = "handle_time")
    @Temporal(TemporalType.TIMESTAMP)
	private Date handleTime;	//处理时间
    
    
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
    @JSONField(serialize = false)
	public AlarmRecord getAlarmRecord() {
		return alarmRecord;
	}
	public void setAlarmRecord(AlarmRecord alarmRecord) {
		this.alarmRecord = alarmRecord;
	}
	public Date getConfirmTime() {
		return confirmTime;
	}
	public void setConfirmTime(Date confirmTime) {
		this.confirmTime = confirmTime;
	}
	public Date getHandleTime() {
		return handleTime;
	}
	public void setHandleTime(Date handleTime) {
		this.handleTime = handleTime;
	}
    
    

}
