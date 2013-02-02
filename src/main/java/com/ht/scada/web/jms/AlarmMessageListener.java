package com.ht.scada.web.jms;

import javax.jms.JMSException;
import javax.jms.Session;
import javax.jms.TextMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jms.listener.SessionAwareMessageListener;
import org.springframework.stereotype.Component;

@Component
public class AlarmMessageListener implements SessionAwareMessageListener<TextMessage> {
	private static final Logger log = LoggerFactory.getLogger(AlarmMessageListener.class);

	@Override
	public void onMessage(TextMessage message, Session session) throws JMSException {
		log.debug("收到报警信息：{}", message.getText());
	}

}
