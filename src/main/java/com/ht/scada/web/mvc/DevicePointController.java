package com.ht.scada.web.mvc;

import com.ht.scada.web.entity.DevicePoint;
import com.ht.scada.web.service.DevicePointService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author admin
 */
@Controller
@RequestMapping("/devicepoint")
public class DevicePointController {
    
    @Autowired
    private DevicePointService devicePointService;   
    
    @RequestMapping(value = "list")
    @ResponseBody
    public List<Map> list(){
        List<Map> rtnlist = new ArrayList<>();
        List<DevicePoint> points = devicePointService.getAllDevicePoint();
        for(DevicePoint point:points){
            Map map = new HashMap();
            map.put("devicetype", point.getDeviceType());
            map.put("x", point.getX());
            map.put("y", point.getY());
            map.put("id", point.getId());
            map.put("name", point.getDeviceName());
            map.put("code", point.getEndTagCode());
            if(point.getParent() != null){
                map.put("parent", point.getParent().getId());
            }else{
                map.put("parent", 0);
            }
            rtnlist.add(map);
        }
        return rtnlist;
    }
}
