/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ht.scada.web.mvc;

import com.ht.scada.web.entity.DevicePoint;
import com.ht.scada.web.service.DevicePointService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author admin
 */
@Controller
@RequestMapping(value = "/admin/device")
public class AdminDevicePointController {
    @Autowired
    private DevicePointService devicePointService;
    
    @RequestMapping(method = RequestMethod.GET)
	public String main(Model model) {
        return "sysmgr/deviceList";
    }
    @RequestMapping(value="drop")
    @ResponseBody
    public int drop(int id){
        int rtn = 1;
        try{
            devicePointService.dropDevicePoint(id);
            rtn = 0;
        }catch(Exception e){
        }
        return rtn;
    }
    @RequestMapping(value="save")
    @ResponseBody
    public int save(int id,String deviceName,String x,String y,String deviceType,String endTagCode,String parent){
        int rtn = 1;
        try{
            DevicePoint point;
            if(id == 0){
                point = new DevicePoint();
            }else{
                point = devicePointService.findDevicePointByID(id);
            }
            int parentId = Integer.parseInt(parent);
            DevicePoint parentPoint =null;
            if(parentId > 0){
                parentPoint = devicePointService.findDevicePointByID(parentId);
            }
            point.setParent(parentPoint);
            point.setDeviceName(deviceName);
            point.setDeviceType(deviceType);
            point.setEndTagCode(endTagCode);
            point.setX(x);
            point.setY(y);
            devicePointService.saveDevicePoint(point);
            
            
            rtn = 0;
        }catch(Exception e){
        }
        return rtn;
    }
    @RequestMapping(value="getbyid")
    @ResponseBody
    public Map getByID(int id){
        DevicePoint point = devicePointService.findDevicePointByID(id);
        Map map = new HashMap();
        map.put("id", point.getId());
        map.put("devicetype", point.getDeviceType());
        map.put("x", point.getX());
        map.put("y", point.getY());
        map.put("name", point.getDeviceName());
        map.put("code", point.getEndTagCode());
        if(point.getParent() != null){
            map.put("parent", point.getParent().getId());
        }else{
            map.put("parent", 0);
        }
        return map;
    }
}
