/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ht.scada.data.service.testimpl;

import com.ht.scada.common.tag.util.VarGroupEnum;
import com.ht.scada.data.model.TimeSeriesDataModel;
import com.ht.scada.data.service.HistoryDataService;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Service;

/**
 *
 * @author admin
 */
@Service
public class HistoryDataServiceimpl implements HistoryDataService{

    @Override
    public List<TimeSeriesDataModel> getVarTimeSeriesData(String code, VarGroupEnum varGroup, String varName, Date start, Date end) {
        return null;
    }

    @Override
    public Map<String, List<TimeSeriesDataModel>> getVarTimeSeriesData(String code, VarGroupEnum varGroup, List<String> varName, Date start, Date end) {
        return null;
    }
    
}
