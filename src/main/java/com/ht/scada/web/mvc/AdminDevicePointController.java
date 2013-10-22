/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ht.scada.web.mvc;

import java.util.Map;
import java.util.HashMap;

import com.ht.scada.web.entity.DevicePoint;
import com.ht.scada.web.service.DevicePointService;

import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 设备信息相关操作Controller
 * @author admin
 */
@Controller
@RequestMapping(value = "/admin/device")
public class AdminDevicePointController {
    @Autowired
    private DevicePointService devicePointService;
    
    /**
     * 获取设备信息列表
     * @param model
     * @return 
     */
    @RequestMapping(method = RequestMethod.GET)
	public String main(Model model) {
        return "sysmgr/deviceList";
    }
    
    /**
     * 删除指定id对应设备信息
     * @param id
     * @return 
     */
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
    
    /**
     * 保存设备信息
     * @param id 设备id
     * @param deviceName 设备名称
     * @param x
     * @param y
     * @param deviceType
     * @param endTagCode
     * @param parent
     * @return 
     */
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
    
    /**
     * 获得设备信息
     * @param id
     * @return 
     */
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
