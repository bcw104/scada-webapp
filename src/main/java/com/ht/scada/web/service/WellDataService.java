/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ht.scada.web.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

public interface WellDataService {
     
    /**
     * 获得日累计产油
     * @param startDate
     * @param endDate
     * @return 
     */
    HashMap getSumData(Date startDate, Date endDate);
    
    /**
     * 获得月平均值
     * @param startDate
     * @param endDate
     * @return 
     */
    HashMap getAvgData(Date startDate, Date endDate);
    
    /**
     * 获得月总值
     * @param startDate
     * @param endDate
     * @return 
     */
    HashMap getSumMonData(Date startDate, Date endDate);
    
    /**
     * 获得产油量
     * @param startDate
     * @param endDate
     * @return 
     */
    List getLineData(Date startDate, Date endDate);
    
    /**
     * 获得产油量
     * @param startDate
     * @param endDate
     * @return 
     */
    List getHourLineData(Date startDate, Date endDate);
    
    /**
     * 获得产液量
     * @param startDate
     * @param endDate
     * @return 
     */
    List getLineData_liquid(Date startDate, Date endDate);
    
    /**
     * 获得产液量
     * @param startDate
     * @param endDate
     * @return 
     */
    List getHourLineData_liquid(Date startDate, Date endDate);
    
     /**
     * 获得油井开井数
     * @param startDate
     * @param endDate
     * @return 
     */
    List getLineData_kjs(Date startDate, Date endDate);
    
    /**
     * 获得油井开井数
     * @param startDate
     * @param endDate
     * @return 
     */
    List getHourLineData_kjs(Date startDate, Date endDate);
    
    /**
     * 获得油井用电量
     * @param startDate
     * @param endDate
     * @return 
     */
    List getLineData_ydl(Date startDate, Date endDate);
    
    /**
     * 获得油井用电量
     * @param startDate
     * @param endDate
     * @return 
     */
    List getHourLineData_ydl(Date startDate, Date endDate);
    
    /**
     * 获得油井注气量
     * @param startDate
     * @param endDate
     * @return 
     */
    List getLineData_zql(Date startDate, Date endDate);
    
    /**
     * 获得油井注气量
     * @param startDate
     * @param endDate
     * @return 
     */
    List getHourLineData_zql(Date startDate, Date endDate);
    
    /**
     * 获得注水站注水量
     * @param startDate
     * @param endDate
     * @return 
     */
    List getLineData_zsl(Date startDate, Date endDate);
    
    /**
     * 获得注水站注水量
     * @param startDate
     * @param endDate
     * @return 
     */
    List getHourLineData_zsl(Date startDate, Date endDate);
    
    /**
     * 获得水井开井数
     * @param startDate
     * @param endDate
     * @return 
     */
    List getLineData_sjkjs(Date startDate, Date endDate);
    
    /**
     * 获得水井开井数
     * @param startDate
     * @param endDate
     * @return 
     */
    List getHourLineData_sjkjs(Date startDate, Date endDate);
    
    /**
     * 获得总用电量
     * @param startDate
     * @param endDate
     * @return 
     */
    List getLineData_zydl(Date startDate, Date endDate);
    
    /**
     * 获得总用电量
     * @param startDate
     * @param endDate
     * @return 
     */
    List getHourLineData_zydl(Date startDate, Date endDate);
    
    /**
     * 获得油井含水量
     * @param startDate
     * @param endDate
     * @return 
     */
    List getLineData_hsl(Date startDate, Date endDate);
    
    /**
     * 获得油井含水量
     * @param startDate
     * @param endDate
     * @return 
     */
    List getHourLineData_hsl(Date startDate, Date endDate);
    
    /**
     * 获得油井含水量
     * @param startDate
     * @param endDate
     * @return 
     */
    List getLineData_zjs(Date startDate, Date endDate);
    
    /**
     * 获得油井总井数
     * @param startDate
     * @param endDate
     * @return 
     */
    List getHourLineData_zjs(Date startDate, Date endDate);
}
