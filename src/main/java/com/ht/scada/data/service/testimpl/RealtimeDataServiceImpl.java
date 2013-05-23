package com.ht.scada.data.service.testimpl;

import com.ht.scada.data.service.RealtimeDataService;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Service;

/**
 *
 * @author
 * admin
 */
@Service
public class RealtimeDataServiceImpl implements RealtimeDataService{

    @Override
    public String[] getBatchValue(String code, String[] name) {
        return null;
    }

    @Override
    public void putBatchValue(Map<String, String> kvMap) {

    }

    @Override
    public void putValue(String key, String value) {
        
    }

    @Override
    public String getValue(String key) {
        return null;
    }

    @Override
    public Map<String, String> getEndTagVarGroupInfo(String code, String group) {
        return null;
    }

    @Override
    public String getEndTagVarInfo(String code, String group, String varName) {
        if(code == null){
            return "1";
        }
        if(code.equals("aaa") ){
            if(group.equals("YOU_JING")){
                if(varName.equals("QI_QING_ZHUANG_TAI")){
                    return "0";
                }
            }
        }
        return "1";
        
    }

    @Override
    public Map<String, String> getEndTagVarInfo(List<String> code, String group, String varName) {
        return null;
    }

    @Override
    public Object[][] getEndTagVarLineData(String code, String group, String varName) {
        return null;
    }
    
}
