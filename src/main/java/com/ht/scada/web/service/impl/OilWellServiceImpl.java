package com.ht.scada.web.service.impl;

import com.ht.scada.oildata.entity.OilWellDailyDataRecord;
import com.ht.scada.oildata.entity.OilWellHourlyDataRecord;
import com.ht.scada.web.dao.OilWellDao;
import com.ht.scada.web.service.OilWellService;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;

@Transactional
@Service("oilWellService")
public class OilWellServiceImpl implements OilWellService {

    @Inject
    private OilWellDao oilWellDao;

    @Override
    public HashMap getSumData(Date startDate, Date endDate) {
        
        HashMap map = new HashMap();
        List lstData = oilWellDao.getSumData(startDate, endDate);
        
        for(Object loopItem : lstData){
            
            Object[] dataTmp = (Object[])loopItem;
            map.put(dataTmp[0], dataTmp[1] + "|" + dataTmp[2] + "|" + dataTmp[3] + "|" + dataTmp[4]);
        }
        
        return map;
    }
    
    @Override
    public HashMap getAvgData(Date startDate, Date endDate) {
        
        HashMap map = new HashMap();
        List lstData = oilWellDao.getAvgData(startDate, endDate);
        
        for(Object loopItem : lstData){
            
            Object[] dataTmp = (Object[])loopItem;
            map.put(dataTmp[0], dataTmp[1] + "|" + dataTmp[2] + "|" + dataTmp[3] + "|" + dataTmp[4]);
        }
        
        return map;
    }
    
    @Override
    public HashMap getSumMonData(Date startDate, Date endDate) {
        
        HashMap map = new HashMap();
        List lstData = oilWellDao.getSumMonData(startDate, endDate);
        
        for(Object loopItem : lstData){
            
            Object[] dataTmp = (Object[])loopItem;
            map.put(dataTmp[0], dataTmp[1] + "|" + dataTmp[2] + "|" + dataTmp[3] + "|" + dataTmp[4]);
        }
        
        return map;
    }
}
