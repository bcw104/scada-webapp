package com.ht.scada.data.service.testimpl;

import com.ht.scada.data.service.RealtimeDataService;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
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

    @Inject
    private TestDataDao testDataDao;

    @Override
    public List<String> getEndTagMultiVarValue(String code, List<String> name) {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }



    @Override
    public Map<String, String> getEndTagVarGroupInfo(String code, String group) {
        
        Map<String ,String > map = new HashMap<>();
        if(code == null || group == null){
            return null;
        }
        List<TestData> list = testDataDao.findByCodeGroup(code, group);
        for(TestData data : list){
            map.put(data.getVarName(), data.getVarValue());
        }
        /*
        if(code.equals("zeng")){
            map.put("zyz_ru_kou_wen_du","27.3");
            map.put("zyz_chu_kou_wen_du","40.3");
            map.put("zyz_wai_shu_ya_li","1.3");
            map.put("zyz_han_shui_lv","56");
            map.put("zyz_shun_shi_liu_liang","0.8");
            map.put("zyz_lei_ji_liu_liang","123");
            map.put("zyz_ye_wei","4.5");
            map.put("zyz_wen_du_1","25");
            map.put("zyz_wen_du_2","27.5");
            map.put("zyz_dian_dong_die_fa","50");
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
*/
        return map;
    }

    @Override
    public String getEndTagVarInfo(String code, String varName) {
        if(code == null || varName == null){
            return "1";
        }

        List<TestData> list = testDataDao.findByCodeName(code, varName);
        if(list == null || list.size() == 0){
            return "";
        }
        return list.get(0).getVarValue();
        /*
        if(code.equals("aaa") ){
            // todo : @候工，获取变量值不需要指定分组了
//            if(group.equals("YOU_JING")){
//                if(varName.equals("QI_QING_ZHUANG_TAI")){
//                    return "0";
//                }
//            }
            if(varName.equals("qi_qing_zhuang_tai")){
                return "0";
            }
        }
        return "1";
        */
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Map<String, float[]> getEndTagVarYcArray(String code, List<String> varName) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getValue(String key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<String> getMultiValue(List<String> key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }



}
