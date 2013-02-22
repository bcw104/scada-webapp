package com.ht.scada.web.mvc;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.atmosphere.cpr.AtmosphereResource;
import org.atmosphere.cpr.Broadcaster;
import org.atmosphere.cpr.MetaBroadcaster;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mvc.atmosphere.AtmosphereUtils;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.async.DeferredResult;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ht.scada.common.middleware.service.JmsService;

/**
 * 报警推画面控制器 报警信息通过http 长轮循的方式实时推送数据到浏览器端
 * 
 * @author 薄成文
 * 
 */
@Controller
@RequestMapping("/alarm/listening")
public class AlarmPushWndController {

	private static final Logger log = LoggerFactory
			.getLogger(AlarmPushWndController.class);
	private final JmsService jmsService;
	private final ObjectMapper objectMapper;

	private final Map<DeferredResult<List<String>>, String> alarmRequests = new ConcurrentHashMap<DeferredResult<List<String>>, String>();

	@Autowired
	public AlarmPushWndController(JmsService jmsService,
			ObjectMapper objectMapper) {
		this.jmsService = jmsService;
		this.objectMapper = objectMapper;
	}

	/**
	 * 订阅报警信息
	 * 
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	@ResponseBody
	public void getAlarmMessages(final AtmosphereResource event, String area)
			throws JsonGenerationException, JsonMappingException, IOException {
		log.debug("订阅报警信息");

		AtmosphereUtils.suspend(event);

		final Broadcaster bc = event.getBroadcaster();
		if (bc != null) {
			log.debug("广播ID：{}", bc.getID());
		}
//
//		final int numberOfClients = bc.getAtmosphereResources().size();
//
//		String statusMessage = "A new Client has connected on "
//				+ new Date().toString() + " (Total: " + numberOfClients + ")";
//
//		log.info(statusMessage);
//
//		bc.broadcast(objectMapper.writeValueAsString(statusMessage));
	}

	/**
	 * TODO: 仅用于模拟推送数据时使用
	 */
	@Scheduled(fixedDelay=500000)
	public void pollForMessages() {

		String statusMessage = "A new message on " + new Date().toString();
		try {
			//log.debug("发送报警信息");
			MetaBroadcaster.getDefault().broadcastTo("/", objectMapper.writeValueAsString(statusMessage));
		} catch (JsonGenerationException e) {
			throw new IllegalStateException(e);
		} catch (JsonMappingException e) {
			throw new IllegalStateException(e);
		} catch (IOException e) {
			throw new IllegalStateException(e);
		}
	}

	/**
	 * 该部分仅用于学习参考，TODO: 产品发布之前删除
	 * 
	 * @return
	 */
	@RequestMapping("json")
	@ResponseBody
	public Map<String, String> json() {
		Map<String, String> map = new HashMap<>();
		map.put("a", "a");
		map.put("b", "b");
		map.put("c", "c");
		return map;
	}
}
