/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ht.scada.data.service.testimpl;

import com.ht.scada.common.tag.util.VarGroupEnum;
import com.ht.scada.data.model.TimeSeriesDataModel;
import com.ht.scada.data.service.HistoryDataService;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;
import org.springframework.stereotype.Service;

/**
 *
 * @author admin
 */
@Service
public class HistoryDataServiceimpl implements HistoryDataService{

    @Override
    public List<TimeSeriesDataModel> getVarTimeSeriesData(String code, VarGroupEnum varGroup, String varName, Date start, Date end) {
        Random r = new Random();
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.HOUR, 2);
        
        List<TimeSeriesDataModel> list = new ArrayList<>();
		for(int i = 0; i< 20;i++){
            cal.add(Calendar.MINUTE, 1);
            TimeSeriesDataModel item = new TimeSeriesDataModel(cal.getTime(), Math.abs(r.nextInt())%10);
            list.add(item);
        }
        return list;
    }

    @Override
    public Map<String, List<TimeSeriesDataModel>> getVarTimeSeriesData(String code, VarGroupEnum varGroup, List<String> varName, Date start, Date end) {
        return null;
    }
    
}
