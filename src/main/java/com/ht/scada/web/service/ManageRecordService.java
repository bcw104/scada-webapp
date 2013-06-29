/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ht.scada.web.service;

import com.ht.scada.data.entity.YkRecord;
import com.ht.scada.data.entity.YtRecord;
import com.ht.scada.security.entity.User;
import java.util.List;

public interface ManageRecordService {
     
    /**
     * 保存遥控数据
     * @param record
     * @return 
     */
    YkRecord saveYk(YkRecord record);
    
    /**
     * 保存遥调数据
     * @param record
     * @return 
     */
    List<YtRecord> saveYt(List<YtRecord> lstRecord);
    
    YtRecord getYt(String strCode, String strTagName, User user);
}
