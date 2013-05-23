package com.ht.scada.data.service.testimpl;

import com.ht.scada.data.service.RealtimeDataService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 *
 * @author
 * admin
 */
@Service
public class RealtimeDataServiceImpl implements RealtimeDataService{


    @Override
    public String getValue(String key) {
        return null;
    }

    @Override
    public List<String> getMultiValue(List<String> key) {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<String> getEndTagMultiVarValue(String code, List<String> name) {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public Map<String, String> getEndTagVarGroupInfo(String code, String group) {
        return null;
    }

    @Override
    public String getEndTagVarInfo(String code, String varName) {
        if(code == null){
            return "1";
        }
        if(code.equals("aaa") ){
            // todo : @候工，获取变量值不需要指定分组了
//            if(group.equals("YOU_JING")){
//                if(varName.equals("QI_QING_ZHUANG_TAI")){
//                    return "0";
//                }
//            }
            if(varName.equals("QI_QING_ZHUANG_TAI")){
                return "0";
            }
        }
        return "1";
        
    }

    @Override
    public Map<String, String> getEndTagVarInfo(List<String> code, String varName) {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public Object[][] getEndTagVarLineData(String code, String varName) {
        return new Object[0][];  //To change body of implemented methods use File | Settings | File Templates.
    }

}
