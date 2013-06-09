/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ht.scada.data.service.testimpl;

import com.ht.scada.common.tag.util.VarGroupEnum;
import com.ht.scada.data.kv.VarGroupData;
import com.ht.scada.data.model.TimeSeriesDataModel;
import com.ht.scada.data.service.HistoryDataService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.stereotype.Service;

/**
 *
 * @author admin
 */
@Service
public class HistoryDataServiceimpl implements HistoryDataService{

    @Override
    public List<TimeSeriesDataModel> getVarTimeSeriesData(String code, VarGroupEnum varGroup, String varName, Date start, Date end){
       SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        
        Random r = new Random();
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.HOUR, 2);
        
        List<TimeSeriesDataModel> list = new ArrayList<>();
		for(int i = 0; i< 20;i++){
            cal.add(Calendar.MINUTE, 1);
            Date d=new Date();
           try {
               d = s.parse(s.format(cal.getTime()));
           } catch (ParseException ex) {
               Logger.getLogger(HistoryDataServiceimpl.class.getName()).log(Level.SEVERE, null, ex);
           }
            TimeSeriesDataModel item = new TimeSeriesDataModel(d, Math.abs(r.nextInt())%10);
            list.add(item);
        }
        return list;
    }

    @Override
    public Map<String, List<TimeSeriesDataModel>> getVarTimeSeriesData(String code, VarGroupEnum varGroup, List<String> varName, Date start, Date end) {
        return null;
    }

    @Override
    public List<VarGroupData> getVarGroupData(String code, VarGroupEnum varGroup, Date start, Date end, int limit) {
        return null;
    }

    @Override
    public VarGroupData getVarGroupData(String code, VarGroupEnum varGroup, Date start) {
        return null;
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
