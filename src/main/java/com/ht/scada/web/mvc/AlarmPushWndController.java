package com.ht.scada.web.mvc;

import com.ht.scada.data.RealtimeDataMessageDelegate;
import com.ht.scada.data.RealtimeMessageListener;
import com.ht.scada.data.entity.FaultRecord;
import com.ht.scada.data.service.AlarmService;
import com.ht.scada.data.service.testimpl.TestDataDao;
import com.ht.scada.security.service.UserService;
import org.atmosphere.cpr.AtmosphereResource;
import org.atmosphere.cpr.Broadcaster;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mvc.atmosphere.AtmosphereUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.async.DeferredResult;

import javax.inject.Inject;
import java.io.IOException;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 报警推画面控制器 报警信息通过http 长轮循的方式实时推送数据到浏览器端
 * 
 * @author 薄成文
 * 
 */
@Controller
@RequestMapping("/alarm/listening")
public class AlarmPushWndController {

	private static final Logger log = LoggerFactory.getLogger(AlarmPushWndController.class);
	private final AlarmService alarmService;
	private final UserService userService;

	@Inject
	private RealtimeMessageListener realtimeImpl;
    @Inject
    private TestDataDao testDataDao;
    /**
     * 实时数据推送代理
     */
    @Inject
    private RealtimeDataMessageDelegate messageDelegate;

	private final Map<DeferredResult<List<String>>, String> alarmRequests = new ConcurrentHashMap<DeferredResult<List<String>>, String>();

	@Autowired
	public AlarmPushWndController(AlarmService alarmService, UserService userService) {
		this.alarmService = alarmService;
		this.userService = userService;
	}

	/**
	 * 订阅报警信息
	 * 
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	@ResponseBody
	public void getAlarmMessages(final AtmosphereResource event, String username)
			throws IOException {
		//log.debug("订阅报警信息:{}",username);

		final Broadcaster bc = event.getBroadcaster();
		if (bc != null) {
			//log.debug("" + userService);
			bc.setID("/" + username);
			//log.debug("广播ID：{}", bc.getID());
		}
		
		AtmosphereUtils.suspend(event);

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
	/*
	 * 
	 * 测试发送报警信息
	 * */
	@RequestMapping(value="push")
    @ResponseBody
	public String  testSendMessages(){
        FaultRecord record = new FaultRecord("youjing", "aaa", "hello", true, new Date());
        //record.setId(UUID.randomUUID().toString());
        realtimeImpl.faultOccured(record);
		//OffLimitsRecord record = new OffLimitsRecord();
		//List<TestData> list;
		//realtimeImpl.offLimitsOccured(record);
        //list = testDataDao.findAll();
        //list = testDataDao.findByCodeGroup("a", "a");
        //list = testDataDao.findByCodeName("a", "a");
        //log.info("当前测试数据有:" + list.size() + "条;");

        return "OK";
	}
    
	/**
	 * TODO: 仅用于模拟推送数据时使用
	 */
//	@Scheduled(fixedDelay=5000)
//	public void pollForMessages() {
//
//		String statusMessage = "A new message on " + new Date().toString();
//		/*
//        RealtimeMessageListener listener = new RealtimeMessageListener() {
//            @Override
//            public void faultOccured(FaultRecord record) {
//                //To change body of implemented methods use File | Settings | File Templates.
//            }
//
//            @Override
//            public void faultResumed(FaultRecord record) {
//                //To change body of implemented methods use File | Settings | File Templates.
//            }
//
//            @Override
//            public void offLimitsOccured(OffLimitsRecord record) {
//                //To change body of implemented methods use File | Settings | File Templates.
//            }
//
//            @Override
//            public void offLimitsResumed(OffLimitsRecord record) {
//                //To change body of implemented methods use File | Settings | File Templates.
//            }
//
//            @Override
//            public void yxChanged(YxRecord record) {
//                //To change body of implemented methods use File | Settings | File Templates.
//            }
//        };
//        messageDelegate.setListener(listener);
//*/
//		try {
//			//log.debug("发送报警信息");
//			//MetaBroadcaster.getDefault().broadcastTo("/", objectMapper.writeValueAsString(statusMessage));
//			MetaBroadcaster.getDefault().broadcastTo("/admin", "A:  " + objectMapper.writeValueAsString(statusMessage));
//			MetaBroadcaster.getDefault().broadcastTo("/admin", "A2:  " + objectMapper.writeValueAsString(statusMessage));
//			MetaBroadcaster.getDefault().broadcastTo("/B", "B:" + objectMapper.writeValueAsString(statusMessage));
//		} catch (JsonGenerationException e) {
//			throw new IllegalStateException(e);
//		} catch (JsonMappingException e) {
//			throw new IllegalStateException(e);
//		} catch (IOException e) {
//			throw new IllegalStateException(e);
//		}
//	}

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
