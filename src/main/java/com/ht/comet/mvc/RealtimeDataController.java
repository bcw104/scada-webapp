package com.ht.comet.mvc;

import com.ht.comet.BroadcasterCache;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

/**
 * Created with IntelliJ IDEA.
 *
 * @author: 薄成文 13-6-8 下午2:53
 * To change this template use File | Settings | File Templates.
 */
@RequestMapping(value = "/_rt")
@Controller
public class RealtimeDataController {

    public static final Logger log = LoggerFactory.getLogger(RealtimeDataController.class);
    public static final String HT_COMET_ID = "_ht_comet_id";

    /**
     * 订阅通道
     * @return
     */
    private void subscribe(String clientId, String channel) {
        BroadcasterCache.getInstance().subscribe(channel, clientId);
    }

    /**
     * 实时获取数据
     * @param session
     * @return
     * @throws java.io.IOException
     */
    @RequestMapping
    @ResponseBody
    public List<BroadcasterCache.CacheMessage> getMessages(HttpSession session, @RequestParam(required = false) String[] channels) throws IOException {
        String clientId = (String) session.getAttribute(HT_COMET_ID);
        if (clientId == null) {
            clientId = UUID.randomUUID().toString();
            //log.debug("new client {}", clientId);
            session.setAttribute(HT_COMET_ID, clientId);
        }
        if (channels != null) {
            //log.debug(Arrays.toString(channels));
            for (String channel : channels) {
                subscribe(clientId, channel);
            }
        }
        return BroadcasterCache.getInstance().retrieveFromCache(clientId);
    }

    private int i = 0;
	//@Scheduled(fixedDelay=5000)
	public void pollForMessages() {

        //todo: 生成测试数据并推送

        log.debug("生成测试数据并推送到/admin");
        //BroadcasterCache.getInstance().broadcast("/a", map);
        BroadcasterCache.getInstance().broadcast("/admin", i);
        i++;
        BroadcasterCache.getInstance().broadcast("/admin", i);
        i++;
        BroadcasterCache.getInstance().broadcast("/admin", i);
        i++;

    }
}
