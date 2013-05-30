package com.ht.scada.data.service.testimpl;

import com.ht.scada.data.service.RealtimeDataService;
import org.springframework.stereotype.Service;

import java.util.HashMap;
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
        Map<String ,String > map = new HashMap<>();
        if(code == null){
            return null;
        }
        if(code.equals("zeng")){
            map.put("ZYZ_RU_KOU_WEN_DU","27.3");
            map.put("ZYZ_CHU_KOU_WEN_DU","40.3");
            map.put("ZYZ_WAI_SHU_YA_LI","1.3");
            map.put("ZYZ_HAN_SHUI_LV","56");
            map.put("ZYZ_SHUN_SHI_LIU_LIANG","0.8");
            map.put("ZYZ_LEI_JI_LIU_LIANG","123");
            map.put("ZYZ_YE_WEI","4.5");
            map.put("ZYZ_WEN_DU_1","25");
            map.put("ZYZ_WEN_DU_2","27.5");
            map.put("ZYZ_DIAN_DONG_DIE_FA","50");
            return map;
        }
        if(code.equals("zhu")){
            map.put("attr01", "a");
            map.put("attr02", "b");
            map.put("attr03", "c");
            map.put("attr04", "d");
            return map;
        }
        if(code.equals("jiezhuan")){
            map.put("attr01", "a");
            map.put("attr02", "b");
            map.put("attr03", "c");
            map.put("attr04", "d");
            return map;
        }

        return map;
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

    @Override
    public float[] getEndTagVarYcArray(String code, String varName) {
        return new float[0];  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public Map<String, float[]> getEndTagVarYcArray(String code, List<String> varName) {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

}
