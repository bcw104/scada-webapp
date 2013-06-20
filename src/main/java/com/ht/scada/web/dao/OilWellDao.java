/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ht.scada.web.dao;

import com.ht.scada.oildata.entity.OilWellDailyDataRecord;
import com.ht.scada.oildata.entity.OilWellHourlyDataRecord;
import com.ht.scada.web.entity.MenuItem;
import java.util.Date;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 *
 * @author Administrator
 */
public interface OilWellDao extends JpaRepository<MenuItem, Integer>{
    
    /**
     * 获得日累计产油
     * @param code
     * @return 
     */   
    @Query("SELECT u.code, SUM(oilProduct), SUM(liquidProduct), SUM(runStatus), SUM(eleConsume) FROM OilWellHourlyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code")
	public List getSumData(Date startDate, Date endDate);
    
    /**
     * 获得月平均值
     * @param code
     * @param startDate
     * @param endDate
     * @return 
     */    
    @Query("SELECT u.code, AVG(oilProduct), AVG(liquidProduct), SUM(runStatus), AVG(eleConsume) FROM OilWellDailyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code")
	public List getAvgData(Date startDate, Date endDate);
    
    /**
     * 获得月总值
     * @param code
     * @param startDate
     * @param endDate
     * @return 
     */    
    @Query("SELECT u.code, SUM(oilProduct), SUM(liquidProduct), SUM(runStatus), SUM(eleConsume) FROM OilWellDailyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code")
	public List getSumMonData(Date startDate, Date endDate);
}
