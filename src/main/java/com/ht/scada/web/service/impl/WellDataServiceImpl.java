package com.ht.scada.web.service.impl;

import com.ht.scada.web.dao.WellDataDao;
import com.ht.scada.web.service.WellDataService;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;

@Transactional
@Service("oilWellService")
public class WellDataServiceImpl implements WellDataService {

    @Inject
    private WellDataDao wellDataDao;

    @Override
    public HashMap getSumData(Date startDate, Date endDate) {
        
        HashMap map = new HashMap();
        List lstData = wellDataDao.getSumData(startDate, endDate);
        lstData.addAll(wellDataDao.getSumDataByZhuShui(startDate, endDate));
        lstData.addAll(wellDataDao.getSumDataByWater(startDate, endDate));
        lstData.addAll(wellDataDao.getSumDataByZhuQi(startDate, endDate));
        
        for(Object loopItem : lstData){
            
            Object[] dataTmp = (Object[])loopItem;
            map.put(dataTmp[0], dataTmp[1] + "|" + dataTmp[2] + "|" + dataTmp[3] + "|" + dataTmp[4] 
                    + "|" + dataTmp[5] + "|" + dataTmp[6] + "|" + dataTmp[7] + "|" + dataTmp[8]);
        }
        
        return map;
    }
    
    @Override
    public HashMap getAvgData(Date startDate, Date endDate) {
        
        HashMap map = new HashMap();
        List lstData = wellDataDao.getAvgData(startDate, endDate);
        lstData.addAll(wellDataDao.getAvgDataByZhuShui(startDate, endDate));
        lstData.addAll(wellDataDao.getAvgDataByWater(startDate, endDate));
        lstData.addAll(wellDataDao.getAvgDataByZhuQi(startDate, endDate));
        
        for(Object loopItem : lstData){
            
            Object[] dataTmp = (Object[])loopItem;
            map.put(dataTmp[0], dataTmp[1] + "|" + dataTmp[2] + "|" + dataTmp[3] + "|" 
                    + dataTmp[4] + "|" + dataTmp[5] + "|" + dataTmp[6] + "|" + dataTmp[7] + "|" + dataTmp[8]);
        }
        
        return map;
    }
    
    @Override
    public HashMap getSumMonData(Date startDate, Date endDate) {
        
        HashMap map = new HashMap();
        List lstData = wellDataDao.getSumMonData(startDate, endDate);
        lstData.addAll(wellDataDao.getSumMonDataByZhuShui(startDate, endDate));
        lstData.addAll(wellDataDao.getSumMonDataByWater(startDate, endDate));
        lstData.addAll(wellDataDao.getSumMonDataByZhuQi(startDate, endDate));
        
        for(Object loopItem : lstData){
            
            Object[] dataTmp = (Object[])loopItem;
            map.put(dataTmp[0], dataTmp[1] + "|" + dataTmp[2] + "|" + dataTmp[3] + "|" 
                    + dataTmp[4] + "|" + dataTmp[5] + "|" + dataTmp[6] + "|" + dataTmp[7] + "|" + dataTmp[8]);
        }
        
        return map;
    }
    
    @Override
    public List getLineData(Date startDate, Date endDate) {
        
        return wellDataDao.getLineData(startDate, endDate);
    }
    
    @Override
    public List getHourLineData(Date startDate, Date endDate) {
        
        return wellDataDao.getHourLineData(startDate, endDate);
    }
    
    @Override
    public List getLineData_liquid(Date startDate, Date endDate) {
        
        return wellDataDao.getLineData_liquid(startDate, endDate);
    }
    
    @Override
    public List getHourLineData_liquid(Date startDate, Date endDate) {
        
        return wellDataDao.getHourLineData_liquid(startDate, endDate);
    }
    
    @Override
    public List getLineData_kjs(Date startDate, Date endDate) {
        
        return wellDataDao.getLineData_kjs(startDate, endDate);
    }
    
    @Override
    public List getHourLineData_kjs(Date startDate, Date endDate) {
        
        return wellDataDao.getHourLineData_kjs(startDate, endDate);
    }
    
    @Override
    public List getLineData_ydl(Date startDate, Date endDate) {
        
        return wellDataDao.getLineData_ydl(startDate, endDate);
    }
    
    @Override
    public List getHourLineData_ydl(Date startDate, Date endDate) {
        
        return wellDataDao.getHourLineData_ydl(startDate, endDate);
    }
    
    @Override
    public List getLineData_zql(Date startDate, Date endDate) {
        
        return wellDataDao.getLineData_zql(startDate, endDate);
    }
    
    @Override
    public List getHourLineData_zql(Date startDate, Date endDate) {
        
        return wellDataDao.getHourLineData_zql(startDate, endDate);
    }
    
    @Override
    public List getLineData_zsl(Date startDate, Date endDate) {
        
        return wellDataDao.getLineData_zsl(startDate, endDate);
    }
    
    @Override
    public List getHourLineData_zsl(Date startDate, Date endDate) {
        
        return wellDataDao.getHourLineData_zsl(startDate, endDate);
    }
    
    @Override
    public List getLineData_sjkjs(Date startDate, Date endDate) {
        
        return wellDataDao.getLineData_sjkjs(startDate, endDate);
    }
    
    @Override
    public List getHourLineData_sjkjs(Date startDate, Date endDate) {
        
        return wellDataDao.getHourLineData_sjkjs(startDate, endDate);
    }
    
    @Override
    public List getLineData_zydl(Date startDate, Date endDate) {
        
        List lstData = wellDataDao.getLineData_ydl(startDate, endDate);
        lstData.addAll(wellDataDao.getLineData_syjydl(startDate, endDate));
        lstData.addAll(wellDataDao.getLineData_zszydl(startDate, endDate));
        lstData.addAll(wellDataDao.getLineData_zqzydl(startDate, endDate));
        
        return lstData;
    }
    
    @Override
    public List getHourLineData_zydl(Date startDate, Date endDate) {
        
        List lstData = wellDataDao.getHourLineData_ydl(startDate, endDate);
        lstData.addAll(wellDataDao.getHourLineData_syjydl(startDate, endDate));
        lstData.addAll(wellDataDao.getHourLineData_zszydl(startDate, endDate));
        lstData.addAll(wellDataDao.getHourLineData_zqzydl(startDate, endDate));
        
        return lstData;
    }
    
    @Override
    public List getLineData_hsl(Date startDate, Date endDate) {
        
        return wellDataDao.getLineData_hsl(startDate, endDate);
    }
    
    @Override
    public List getHourLineData_hsl(Date startDate, Date endDate) {
        
        return wellDataDao.getHourLineData_hsl(startDate, endDate);
    }
    
    @Override
    public List getLineData_zjs(Date startDate, Date endDate) {
        
        return wellDataDao.getLineData_zjs(startDate, endDate);
    }
    
    @Override
    public List getHourLineData_zjs(Date startDate, Date endDate) {
        
        return wellDataDao.getHourLineData_zjs(startDate, endDate);
    }
}
