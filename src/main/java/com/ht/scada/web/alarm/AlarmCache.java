/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ht.scada.web.alarm;

import com.ht.scada.web.entity.AlarmRecord;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 报警缓存
 * @author 赵磊
 */
public class AlarmCache {
    private static AlarmCache instance = new AlarmCache();
    
    public static AlarmCache getInstance() {
        return instance;
    }
    
    /**
     * 报警缓存，key表示报警id
     */
    private final Map<String, AlarmRecord> alarmInfoCache = new ConcurrentHashMap<>();
    
    public void putAlarm(String id, AlarmRecord alarmRecord) {
        alarmInfoCache.put(id, alarmRecord);
    }
    
    public AlarmRecord getAlarm(String id) {
        return alarmInfoCache.get(id);
    }
    
    public void removeAlarm(String id) {
        alarmInfoCache.remove(id);
    }
    
}
