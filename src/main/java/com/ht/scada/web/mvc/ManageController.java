package com.ht.scada.web.mvc;

import com.ht.scada.common.tag.entity.EndTag;
import com.ht.scada.common.tag.entity.MajorTag;
import com.ht.scada.common.tag.service.EndTagService;
import com.ht.scada.common.tag.util.VarSubTypeEnum;
import com.ht.scada.data.entity.YkRecord;
import com.ht.scada.data.entity.YtRecord;
import com.ht.scada.data.service.RealtimeDataService;
import com.ht.scada.security.entity.User;
import com.ht.scada.security.service.UserService;
import com.ht.scada.web.service.ManageRecordService;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 调度运行页面操作
 * @author Administrator
 */
@Controller
@RequestMapping(value = "/manage")
public class ManageController {
    
    private static final Logger log = LoggerFactory.getLogger(RegisterController.class);	
    
    @Autowired
	private UserService userService;
    @Autowired
	private EndTagService endTagService;
    @Autowired
	private ManageRecordService manageRecordService;
    @Autowired
    private RealtimeDataService realtimeDataService;
    
    /**
     * 保存遥控数据
     * @param id
     * @param state
     * @param content
     * @return 
     */
    @RequestMapping(value="saveYkData")
    @ResponseBody
    public Map saveYkData(String id, String state, String content){
        
        HashMap mapResult = new HashMap();
        
        YkRecord ykRecord = new YkRecord();
        
        // 当前用户基本信息
        User user = userService.getCurrentUser();
        // 井基本信息
        EndTag endTag = endTagService.getById(Integer.valueOf(id));
        
        try{
            ykRecord.setCode(endTag.getCode());
            ykRecord.setPosition(getPosition(endTag.getMajorTag()) + "/" +  endTag.getName());
            ykRecord.setTagName(VarSubTypeEnum.YK_QI_TING_JING.getValue());
            ykRecord.setStatus(Integer.valueOf(state));
            ykRecord.setDate(new Date());
            ykRecord.setUser(user);
            ykRecord.setRemark(content);

            ykRecord = manageRecordService.saveYk(ykRecord);
            mapResult.put("state", 1);
        }catch(Exception ex){
            mapResult.put("state", 0);
        }
        
        return mapResult;
    }	
    
    /**
     * 获得遥调数据
     * @param id
     * @return 
     */
    @RequestMapping(value="getYtData")
    @ResponseBody
    public Map getYtData(String id){
        
        HashMap mapResult = new HashMap();
        
        YtRecord ytRecord = null;
        
        // 当前用户基本信息
        User user = userService.getCurrentUser();
        // 井基本信息
        EndTag endTag = endTagService.getById(Integer.valueOf(id));
        
        List<String> lstVarNames = new ArrayList<>();
        lstVarNames.add(VarSubTypeEnum.YT_CHONGCI_SHANG_YC.toString().toLowerCase());
        lstVarNames.add(VarSubTypeEnum.YT_CHONGCI_XIA_YC.toString().toLowerCase());
        lstVarNames.add(VarSubTypeEnum.YT_CHONGCHENG_SHANG_YC.toString().toLowerCase());
        lstVarNames.add(VarSubTypeEnum.YT_CHONGCHENG_XIA_YC.toString().toLowerCase());
        
        List<String> mapVarVales = realtimeDataService.getEndTagMultiVarValue(endTag.getCode(), lstVarNames);
        
        if(mapVarVales != null){
            mapResult.put("tc_scch", mapVarVales.get(0));
            mapResult.put("tc_scci", mapVarVales.get(1));
            mapResult.put("tc_xcch", mapVarVales.get(2));
            mapResult.put("tc_xcci", mapVarVales.get(3));
        }else{
            mapResult.put("tc_scch", 0);
            mapResult.put("tc_scci", 0);
            mapResult.put("tc_xcch", 0);
            mapResult.put("tc_xcci", 0);
        }
        
        return mapResult;
    }
    
    /**
     * 保存遥调数据
     * @param id
     * @param content
     * @param scch
     * @param scci
     * @param xcch
     * @param xcci
     * @return 
     */
    @RequestMapping(value="saveYtData")
    @ResponseBody
    public Map saveYtData(String id, String content, String scch, String scci, String xcch, String xcci){
        
        HashMap mapResult = new HashMap();
        
        String[] strTmp = null;
                
        YtRecord ytRecord1 = null;
        YtRecord ytRecord2 = null;
        YtRecord ytRecord3 = null;
        YtRecord ytRecord4 = null;
        
        List<YtRecord> lstRecord = new ArrayList<>();
        
        // 当前用户基本信息
        User user = userService.getCurrentUser();
        // 井基本信息
        EndTag endTag = endTagService.getById(Integer.valueOf(id));
        
        try{
            ytRecord1 = new YtRecord();            
            ytRecord1.setCode(endTag.getCode());
            ytRecord1.setPosition(getPosition(endTag.getMajorTag()) + "/" +  endTag.getName());
            ytRecord1.setTagName(VarSubTypeEnum.YT_CHONGCI_SHANG.getValue());            
            strTmp = scch.split("\\|\\|");            
            ytRecord1.setOldValue(strTmp[1]);
            ytRecord1.setNewValue(strTmp[0]);
            ytRecord1.setDate(new Date());
            ytRecord1.setUser(user);
            ytRecord1.setRemark(content);
            lstRecord.add(ytRecord1);
            
            ytRecord2 = new YtRecord();            
            ytRecord2.setCode(endTag.getCode());
            ytRecord2.setPosition(getPosition(endTag.getMajorTag()) + "/" +  endTag.getName());
            ytRecord2.setTagName(VarSubTypeEnum.YT_CHONGCI_XIA.getValue());            
            strTmp = scci.split("\\|\\|");            
            ytRecord2.setOldValue(strTmp[1]);
            ytRecord2.setNewValue(strTmp[0]);
            ytRecord2.setDate(new Date());
            ytRecord2.setUser(user);
            ytRecord2.setRemark(content);
            lstRecord.add(ytRecord2);
            
            ytRecord3 = new YtRecord();            
            ytRecord3.setCode(endTag.getCode());
            ytRecord3.setPosition(getPosition(endTag.getMajorTag()) + "/" +  endTag.getName());
            ytRecord3.setTagName(VarSubTypeEnum.YT_CHONGCHENG_SHANG.getValue());            
            strTmp = xcch.split("\\|\\|");            
            ytRecord3.setOldValue(strTmp[1]);
            ytRecord3.setNewValue(strTmp[0]);
            ytRecord3.setDate(new Date());
            ytRecord3.setUser(user);
            ytRecord3.setRemark(content);
            lstRecord.add(ytRecord3);
            
            ytRecord4 = new YtRecord();            
            ytRecord4.setCode(endTag.getCode());
            ytRecord4.setPosition(getPosition(endTag.getMajorTag()) + "/" +  endTag.getName());
            ytRecord4.setTagName(VarSubTypeEnum.YT_CHONGCHENG_XIA.getValue());            
            strTmp = xcci.split("\\|\\|");            
            ytRecord4.setOldValue(strTmp[1]);
            ytRecord4.setNewValue(strTmp[0]);
            ytRecord4.setDate(new Date());
            ytRecord4.setUser(user);
            ytRecord4.setRemark(content);
            lstRecord.add(ytRecord4);

            lstRecord = manageRecordService.saveYt(lstRecord);
            mapResult.put("state", 1);
        }catch(Exception ex){
            mapResult.put("state", 0);
        }
        
        return mapResult;
    }
    
    /**
     * 获得机构名称
     * @param p_majorTag
     * @return 
     */
    private String getPosition(MajorTag p_majorTag){
        
        if(p_majorTag.getParent() != null){
            return getPosition(p_majorTag.getParent()) + "/" +  p_majorTag.getName();
        }
        
        return p_majorTag.getName();
    }
}
