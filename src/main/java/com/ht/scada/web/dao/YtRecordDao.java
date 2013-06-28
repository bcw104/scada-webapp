/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ht.scada.web.dao;

import com.ht.scada.data.entity.YtRecord;
import com.ht.scada.security.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 *
 * @author Administrator
 */
public interface YtRecordDao extends JpaRepository<YtRecord, Integer>{
    
    @Query("SELECT t FROM YtRecord t WHERE t.code=?1 AND t.tagName=?2 AND t.user=?3 GROUP BY t.date")
	public YtRecord getYt(String strCode, String strTagName, User user);
}
