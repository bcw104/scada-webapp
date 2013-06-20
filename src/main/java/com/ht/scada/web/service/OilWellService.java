/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ht.scada.web.service;

import com.ht.scada.oildata.entity.OilWellDailyDataRecord;
import com.ht.scada.oildata.entity.OilWellHourlyDataRecord;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface OilWellService {
     
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
}
