package com.ht.comet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.*;
import java.util.concurrent.*;

/**
 * Created with IntelliJ IDEA.
 *
 * @author: 薄成文 13-7-1 下午2:37
 * To change this template use File | Settings | File Templates.
 */
public class BroadcasterCache {
    private static final Logger logger = LoggerFactory.getLogger(BroadcasterCache.class);


    /**
     * 通道监听者, channel:clients
     */
    private final Map<String, Set<String>> channelClients = new ConcurrentHashMap<>();

    /**
     * 客户端缓存队列
     * clientId:messageQueue
     */
    private final Map<String, ClientQueue> messages = new ConcurrentHashMap<>();

    /**
     * 客户端活动时间, clientId:time
     */
    private final Map<String, Long> activeClients = new ConcurrentHashMap<>();

    private ScheduledFuture scheduledFuture;
    protected ScheduledExecutorService taskScheduler = Executors.newSingleThreadScheduledExecutor();

    private long clientIdleTime = TimeUnit.MINUTES.toMillis(2);//2 minutes

    private long invalidateCacheInterval = TimeUnit.MINUTES.toMillis(1);//1 minute

    public static class ClientQueue {

        private final LinkedList<CacheMessage> queue = new LinkedList<CacheMessage>();


        public LinkedList<CacheMessage> getQueue() {
            return queue;
        }

        @Override
        public String toString(){
            return queue.toString();
        }
    }

    public static class CometClient {
        private final String clientId;
        private Set<String> channels = new HashSet<>();

        public CometClient(String clientId) {
            this.clientId = clientId;
        }

        public String getClientId() {
            return clientId;
        }

        public Set<String> getChannels() {
            return channels;
        }

        public void setChannels(Set<String> channels) {
            this.channels = channels;
        }
    }

    public static class CacheMessage {

        private final String channel;
        private final Object message;

        private CacheMessage(String channel, Object message) {
            this.channel = channel;
            this.message = message;
        }

        public String getChannel() {
            return channel;
        }

        public Object getMessage() {
            return message;
        }

        public String toString(){
            return message.toString();
        }
    }
    private static  BroadcasterCache instance = new BroadcasterCache();

    public static BroadcasterCache getInstance() {
        return instance;
    }

    private BroadcasterCache() {
    }

    public void setInvalidateCacheInterval(long invalidateCacheInterval) {
        this.invalidateCacheInterval = invalidateCacheInterval;
        scheduledFuture.cancel(true);
        start();
    }

    public void setClientIdleTime(long clientIdleTime) {
        this.clientIdleTime = clientIdleTime;
    }

    public void setExecutorService(ScheduledExecutorService reaper) {
        if (scheduledFuture != null) {
            scheduledFuture.cancel(false);
            scheduledFuture = null;
        }

        if (taskScheduler != null) {
            stop();
        }
        this.taskScheduler = reaper;
    }

    public void start() {
        scheduledFuture = taskScheduler.scheduleWithFixedDelay(new Runnable() {
            @Override
            public void run() {
                invalidateExpiredEntries();
            }
        }, 0, invalidateCacheInterval, TimeUnit.MILLISECONDS);
    }

    protected void invalidateExpiredEntries() {
        long now = System.currentTimeMillis();
        synchronized (messages) {

            Set<String> inactiveClients = new HashSet<>();

            for (Map.Entry<String, Long> entry : activeClients.entrySet()) {
                if (now - entry.getValue() > clientIdleTime) {
                    logger.debug("Invalidate client {}", entry.getKey());
                    inactiveClients.add(entry.getKey());
                }
            }

            for (String clientId : inactiveClients) {
                activeClients.remove(clientId);
                messages.remove(clientId);
            }

            for (Set<String> clients : channelClients.values()) {
                clients.removeAll(inactiveClients);
            }
        }
    }

    public void stop() {
        if (scheduledFuture != null) {
            scheduledFuture.cancel(false);
            scheduledFuture = null;
        }
        taskScheduler.shutdown();
    }

    public void subscribe(String channel, String clientId) {
        logger.debug("client {} subscribe channel {}", clientId, channel);
        synchronized (channelClients) {
            Set<String> clients = channelClients.get(channel);
            if (clients == null) {
                clients = new HashSet<>();
                channelClients.put(channel, clients);
            }
            clients.add(clientId);
        }
    }

    public void broadcast(String channel, Object message) {
        synchronized (channelClients) {
            Set<String> clients = channelClients.get(channel);
            if (clients != null) {
                for (String client : clients) {
                    addToCache(channel, client, message);
                }
            } else {
                logger.debug("no client listening channel {}", channel);
            }
        }
    }

    private void addToCache(String channel, String client, Object message) {

        if (logger.isTraceEnabled()) {
            logger.trace("Adding for AtmosphereResource {} cached messages {}", client, message);
            logger.trace("Active clients {}", activeClients);
        }

        CacheMessage cacheMessage = new CacheMessage(channel, message);
        synchronized (messages) {
            addMessage(client, cacheMessage);
        }
    }

    private void addMessage(String clientId, CacheMessage message) {
        logger.debug("Adding message {} for client {}", message, clientId);
        ClientQueue clientQueue = messages.get(clientId);
        if (clientQueue == null) {
            clientQueue = new ClientQueue();
            messages.put(clientId, clientQueue);
        }
        clientQueue.getQueue().addLast(message);
    }


    public List<CacheMessage> retrieveFromCache(String clientId) {
        long now = System.currentTimeMillis();

        ClientQueue clientQueue;
        synchronized (messages) {
            activeClients.put(clientId, now);
            clientQueue = messages.remove(clientId);
        }
        if (clientQueue == null) {
            logger.debug("client {} cache is empty", clientId);
            return Collections.emptyList();
        } else {
            List<CacheMessage> clientMessages = clientQueue.getQueue();
            if (logger.isTraceEnabled()) {
                synchronized (messages) {
                    logger.trace("Retrieved for AtmosphereResource {} cached messages {}", clientId, clientMessages);
                    logger.trace("Available cached message {}", messages);
                }
            }
            return clientMessages;
        }

    }

    public void clearCache(String channel, String clientId) {
        ClientQueue clientQueue;
        synchronized (messages) {
            clientQueue = messages.get(clientId);
            if (clientQueue != null) {
                for (CacheMessage message : clientQueue.getQueue()) {
                    logger.debug("Removing for AtmosphereResource {} cached message {}", clientId, message.getMessage());
                    if (message.getChannel().equals(channel)) {
                        clientQueue.getQueue().remove(message);
                    }
                }
            }
        }
    }

    public Map<String, ClientQueue> messages() {
        return messages;
    }

}
