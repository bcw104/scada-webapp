package com.ht.scada.web.mvc;

import com.ht.scada.common.tag.entity.AcquisitionDevice;
import com.ht.scada.common.tag.entity.EndTag;
import com.ht.scada.common.tag.entity.SensorDevice;
import com.ht.scada.common.tag.service.EndTagService;
import com.ht.scada.common.tag.util.VarSubTypeEnum;
import com.ht.scada.data.service.RealtimeDataService;
import com.ht.scada.security.service.UserService;
import com.ht.scada.web.service.AcquisitionDeviceWebService;
import java.util.ArrayList;
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
 * 生产管理页面操作
 * @author Administrator
 */
@Controller
@RequestMapping(value = "/produce")
public class ProduceController {
    
    private static final Logger log = LoggerFactory.getLogger(RegisterController.class);	
    
    @Autowired
	private UserService userService;
    @Autowired
    private EndTagService endTagService;
    @Autowired
    private RealtimeDataService realtimeDataService;
    @Autowired
    private AcquisitionDeviceWebService acquisitionDeviceService;
    
    @RequestMapping(value="deviceList")
    @ResponseBody
    public List<Map> deviceList(){
        
        List<Map> lstRusult = new ArrayList<>();
        
        List<EndTag> lstEndTag = endTagService.getAllEndTag();
        for(EndTag loopEndTag:lstEndTag){
            
            AcquisitionDevice tmpDevice = loopEndTag.getDevice();
            if(tmpDevice != null){
                
                HashMap mapDevice = new HashMap();
                // 设备ID
                mapDevice.put("id", tmpDevice.getId());
                // 设备名称
                mapDevice.put("name", tmpDevice.getName());
                // 生产厂家
                mapDevice.put("manufacture", tmpDevice.getManufacture());
                // 型号
                mapDevice.put("type", tmpDevice.getType());
                // 序号
                mapDevice.put("number", tmpDevice.getNumber());
                // 设备地址
                mapDevice.put("address", tmpDevice.getAddress());
                // 井名
                mapDevice.put("endtagname", loopEndTag.getName());
                // IP地址
                mapDevice.put("ip", tmpDevice.getChannel().getPortInfo());
                // 通讯状态
                mapDevice.put("state",realtimeDataService.getEndTagVarInfo(loopEndTag.getCode(), "rtu_rj45_status"));
                
                // 遍历传感器设备
                List<Map> lstSensor = new ArrayList<>();
                for(SensorDevice loopSensor:tmpDevice.getSensorDevices()){
                    HashMap mapSensor = new HashMap();
                     // 设备ID
                    mapSensor.put("id", loopSensor.getId());
                     // 设备名称
                    mapSensor.put("name", loopSensor.getName());
                    // 生产厂家
                    mapSensor.put("manufacture", loopSensor.getManufacture());
                    // 型号
                    mapSensor.put("type", loopSensor.getType());
                    // 序号
                    mapSensor.put("number", loopSensor.getNumber());
                    // 设备地址
                    mapSensor.put("address", loopSensor.getAddress());
                    // 井名
                    mapSensor.put("endtagname", loopEndTag.getName());
                    // IP地址
                    mapSensor.put("ip", tmpDevice.getChannel().getPortInfo());
                    // 通讯状态
                    mapSensor.put("state",realtimeDataService.getEndTagVarInfo(loopEndTag.getCode(), "cgq_rtu_status_" + loopSensor.getNickName()));
                    
                    lstSensor.add(mapSensor);
                }
                
                mapDevice.put("sensor", lstSensor);
                lstRusult.add(mapDevice);
            }           
        }
        return lstRusult;
    }
}
