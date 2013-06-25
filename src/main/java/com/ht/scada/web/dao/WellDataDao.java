/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ht.scada.web.dao;

import com.ht.scada.web.entity.MenuItem;
import java.util.Date;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 *
 * @author Administrator
 */
public interface WellDataDao extends JpaRepository<MenuItem, Integer>{
    
    /**
     * 获得日累计产量（油井）
     * @param code
     * @return 
     */   
    @Query("SELECT u.code, SUM(oilProduct), SUM(liquidProduct), SUM(runStatus), SUM(eleConsume), SUM(zhuQi), 0, 0, SUM(hanShui) FROM OilWellHourlyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code")
	public List getSumData(Date startDate, Date endDate);
    
    /**
     * 获得月平均值（油井）
     * @param code
     * @param startDate
     * @param endDate
     * @return 
     */    
    @Query("SELECT u.code, AVG(oilProduct), AVG(liquidProduct), SUM(runStatus), AVG(eleConsume), AVG(zhuQi), 0, 0, AVG(hanShui) FROM OilWellDailyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code")
	public List getAvgData(Date startDate, Date endDate);
    
    /**
     * 获得月总值（油井）
     * @param code
     * @param startDate
     * @param endDate
     * @return 
     */    
    @Query("SELECT u.code, SUM(oilProduct), SUM(liquidProduct), SUM(runStatus), SUM(eleConsume), SUM(zhuQi), 0, 0, SUM(hanShui) FROM OilWellDailyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code")
	public List getSumMonData(Date startDate, Date endDate);
    
    /**
     * 获得日累计产量（注水站）
     * @param code
     * @return 
     */   
    @Query("SELECT u.code, 0, 0, 0, SUM(eleConsume), 0, SUM(water), 0, 0 FROM ZhuShuiHourlyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code")
	public List getSumDataByZhuShui(Date startDate, Date endDate);
    
    /**
     * 获得月平均值（注水站）
     * @param code
     * @param startDate
     * @param endDate
     * @return 
     */    
    @Query("SELECT u.code, 0, 0, 0, AVG(eleConsume), 0, AVG(water), 0, 0 FROM ZhuShuiDailyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code")
	public List getAvgDataByZhuShui(Date startDate, Date endDate);
    
    /**
     * 获得月总值（注水站）
     * @param code
     * @param startDate
     * @param endDate
     * @return 
     */    
    @Query("SELECT u.code, 0, 0, 0, SUM(eleConsume), 0, SUM(water), 0, 0 FROM ZhuShuiDailyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code")
	public List getSumMonDataByZhuShui(Date startDate, Date endDate);
    
    /**
     * 获得日累计产量（水源井）
     * @param code
     * @return 
     */   
    @Query("SELECT u.code, 0, 0, 0, SUM(eleConsume), 0, 0, SUM(runStatus), 0 FROM WaterWellHourlyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code")
	public List getSumDataByWater(Date startDate, Date endDate);
    
    /**
     * 获得月平均值（水源井）
     * @param code
     * @param startDate
     * @param endDate
     * @return 
     */    
    @Query("SELECT u.code, 0, 0, 0, AVG(eleConsume), 0, 0, SUM(runStatus), 0 FROM WaterWellDailyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code")
	public List getAvgDataByWater(Date startDate, Date endDate);
    
    /**
     * 获得月总值（水源井）
     * @param code
     * @param startDate
     * @param endDate
     * @return 
     */    
    @Query("SELECT u.code, 0, 0, 0, SUM(eleConsume), 0, 0, SUM(runStatus), 0 FROM WaterWellDailyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code")
	public List getSumMonDataByWater(Date startDate, Date endDate);
    
    /**
     * 获得日累计产量（注汽站）
     * @param code
     * @return 
     */   
    @Query("SELECT u.code, 0, 0, 0, SUM(eleConsume), 0, 0, SUM(runStatus), 0 FROM ZhuQiHourlyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code")
	public List getSumDataByZhuQi(Date startDate, Date endDate);
    
    /**
     * 获得月平均值（注汽站）
     * @param code
     * @param startDate
     * @param endDate
     * @return 
     */    
    @Query("SELECT u.code, 0, 0, 0, SUM(eleConsume), 0, 0, SUM(runStatus), 0 FROM ZhuQiDailyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code")
	public List getAvgDataByZhuQi(Date startDate, Date endDate);
    
    /**
     * 获得月总值（注汽站）
     * @param code
     * @param startDate
     * @param endDate
     * @return 
     */    
    @Query("SELECT u.code, 0, 0, 0, SUM(eleConsume), 0, 0, SUM(runStatus), 0 FROM ZhuQiDailyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code")
	public List getSumMonDataByZhuQi(Date startDate, Date endDate);
    
    /**
     * 获得产油量（油井）
     * @param code
     * @return 
     */   
    @Query("SELECT u.code, u.statisticsDate, SUM(u.oilProduct) FROM OilWellDailyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code, u.statisticsDate ORDER BY u.statisticsDate")
	public List getLineData(Date startDate, Date endDate);
    
    /**
     * 获得产油量（油井）
     * @param code
     * @return 
     */   
    @Query("SELECT u.code, u.statisticsTime, SUM(u.oilProduct) FROM OilWellHourlyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code, u.statisticsTime ORDER BY u.statisticsTime")
	public List getHourLineData(Date startDate, Date endDate);
    
    /**
     * 获得产液量（油井）
     * @param code
     * @return 
     */   
    @Query("SELECT u.code, u.statisticsDate, SUM(u.liquidProduct) FROM OilWellDailyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code, u.statisticsDate ORDER BY u.statisticsDate")
	public List getLineData_liquid(Date startDate, Date endDate);
    
    /**
     * 获得产液量（油井）
     * @param code
     * @return 
     */   
    @Query("SELECT u.code, u.statisticsTime, SUM(u.liquidProduct) FROM OilWellHourlyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code, u.statisticsTime ORDER BY u.statisticsTime")
	public List getHourLineData_liquid(Date startDate, Date endDate);
    
    /**
     * 获得开井数（油井）
     * @param code
     * @return 
     */   
    @Query("SELECT u.code, u.statisticsDate, SUM(u.runStatus) FROM OilWellDailyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code, u.statisticsDate ORDER BY u.statisticsDate")
	public List getLineData_kjs(Date startDate, Date endDate);
    
    /**
     * 获得开井数（油井）
     * @param code
     * @return 
     */   
    @Query("SELECT u.code, u.statisticsTime, SUM(u.runStatus) FROM OilWellHourlyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code, u.statisticsTime ORDER BY u.statisticsTime")
	public List getHourLineData_kjs(Date startDate, Date endDate);
    
    /**
     * 获得用电量（油井）
     * @param code
     * @return 
     */   
    @Query("SELECT u.code, u.statisticsDate, SUM(u.eleConsume) FROM OilWellDailyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code, u.statisticsDate ORDER BY u.statisticsDate")
	public List getLineData_ydl(Date startDate, Date endDate);
    
    /**
     * 获得用电量（油井）
     * @param code
     * @return 
     */   
    @Query("SELECT u.code, u.statisticsTime, SUM(u.eleConsume) FROM OilWellHourlyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code, u.statisticsTime ORDER BY u.statisticsTime")
	public List getHourLineData_ydl(Date startDate, Date endDate);
    
    /**
     * 获得注气量（油井）
     * @param code
     * @return 
     */   
    @Query("SELECT u.code, u.statisticsDate, SUM(u.zhuQi) FROM OilWellDailyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code, u.statisticsDate ORDER BY u.statisticsDate")
	public List getLineData_zql(Date startDate, Date endDate);
    
    /**
     * 获得注气量（油井）
     * @param code
     * @return 
     */   
    @Query("SELECT u.code, u.statisticsTime, SUM(u.zhuQi) FROM OilWellHourlyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code, u.statisticsTime ORDER BY u.statisticsTime")
	public List getHourLineData_zql(Date startDate, Date endDate);
    
    /**
     * 获得注水量（注水站）
     * @param code
     * @return 
     */   
    @Query("SELECT u.code, u.statisticsDate, SUM(u.water) FROM ZhuShuiDailyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code, u.statisticsDate ORDER BY u.statisticsDate")
	public List getLineData_zsl(Date startDate, Date endDate);
    
    /**
     * 获得注水量（注水站）
     * @param code
     * @return 
     */   
    @Query("SELECT u.code, u.statisticsTime, SUM(u.water) FROM ZhuShuiHourlyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code, u.statisticsTime ORDER BY u.statisticsTime")
	public List getHourLineData_zsl(Date startDate, Date endDate);
    
    /**
     * 获得注水量（注水站）
     * @param code
     * @return 
     */   
    @Query("SELECT u.code, u.statisticsDate, SUM(u.runStatus) FROM WaterWellDailyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code, u.statisticsDate ORDER BY u.statisticsDate")
	public List getLineData_sjkjs(Date startDate, Date endDate);
    
    /**
     * 获得注水量（注水站）
     * @param code
     * @return 
     */   
    @Query("SELECT u.code, u.statisticsTime, SUM(u.runStatus) FROM WaterWellHourlyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code, u.statisticsTime ORDER BY u.statisticsTime")
	public List getHourLineData_sjkjs(Date startDate, Date endDate);
    
    /**
     * 获得用电量（水源井）
     * @param code
     * @return 
     */   
    @Query("SELECT u.code, u.statisticsDate, SUM(u.eleConsume) FROM WaterWellDailyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code, u.statisticsDate ORDER BY u.statisticsDate")
	public List getLineData_syjydl(Date startDate, Date endDate);
    
    /**
     * 获得用电量（水源井）
     * @param code
     * @return 
     */   
    @Query("SELECT u.code, u.statisticsTime, SUM(u.eleConsume) FROM WaterWellHourlyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code, u.statisticsTime ORDER BY u.statisticsTime")
	public List getHourLineData_syjydl(Date startDate, Date endDate);
    
    /**
     * 获得用电量（注水站）
     * @param code
     * @return 
     */   
    @Query("SELECT u.code, u.statisticsDate, SUM(u.eleConsume) FROM ZhuShuiDailyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code, u.statisticsDate ORDER BY u.statisticsDate")
	public List getLineData_zszydl(Date startDate, Date endDate);
    
    /**
     * 获得用电量（注水站）
     * @param code
     * @return 
     */   
    @Query("SELECT u.code, u.statisticsTime, SUM(u.eleConsume) FROM ZhuShuiHourlyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code, u.statisticsTime ORDER BY u.statisticsTime")
	public List getHourLineData_zszydl(Date startDate, Date endDate);
    
    /**
     * 获得用电量（注水站）
     * @param code
     * @return 
     */   
    @Query("SELECT u.code, u.statisticsDate, SUM(u.eleConsume) FROM ZhuQiDailyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code, u.statisticsDate ORDER BY u.statisticsDate")
	public List getLineData_zqzydl(Date startDate, Date endDate);
    
    /**
     * 获得用电量（注水站）
     * @param code
     * @return 
     */   
    @Query("SELECT u.code, u.statisticsTime, SUM(u.eleConsume) FROM ZhuQiHourlyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code, u.statisticsTime ORDER BY u.statisticsTime")
	public List getHourLineData_zqzydl(Date startDate, Date endDate);
    
    /**
     * 获得含水量（油井）
     * @param code
     * @return 
     */   
    @Query("SELECT u.code, u.statisticsDate, SUM(u.hanShui) FROM OilWellDailyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code, u.statisticsDate ORDER BY u.statisticsDate")
	public List getLineData_hsl(Date startDate, Date endDate);
    
    /**
     * 获得含水量（油井）
     * @param code
     * @return 
     */   
    @Query("SELECT u.code, u.statisticsTime, SUM(u.hanShui) FROM OilWellHourlyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code, u.statisticsTime ORDER BY u.statisticsTime")
	public List getHourLineData_hsl(Date startDate, Date endDate);
    
    /**
     * 获得总井数（油井）
     * @param code
     * @return 
     */   
    @Query("SELECT u.code, u.statisticsDate, COUNT(*) FROM OilWellDailyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code, u.statisticsDate ORDER BY u.statisticsDate")
	public List getLineData_zjs(Date startDate, Date endDate);
    
    /**
     * 获得总井数（油井）
     * @param code
     * @return 
     */   
    @Query("SELECT u.code, u.statisticsTime, COUNT(*) FROM OilWellHourlyDataRecord u WHERE u.statisticsDate>=?1 AND u.statisticsDate<?2 GROUP BY u.code, u.statisticsTime ORDER BY u.statisticsTime")
	public List getHourLineData_zjs(Date startDate, Date endDate);
}
