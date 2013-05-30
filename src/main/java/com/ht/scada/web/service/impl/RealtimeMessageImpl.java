package com.ht.scada.web.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ht.scada.data.RealtimeMessageListener;
import com.ht.scada.data.entity.FaultRecord;
import com.ht.scada.data.entity.OffLimitsRecord;
import com.ht.scada.data.entity.YxRecord;


public class RealtimeMessageImpl implements RealtimeMessageListener {
	
	private static final Logger log = LoggerFactory.getLogger(RealtimeMessageImpl.class);
	
	@Override
	public void faultOccured(FaultRecord record) {
		// TODO Auto-generated method stub
		log.info("接收报警信息——faultOccured");
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

}
