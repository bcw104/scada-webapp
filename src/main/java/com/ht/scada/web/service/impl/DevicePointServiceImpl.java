/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ht.scada.web.service.impl;

import com.ht.scada.web.dao.DevicePointDao;
import com.ht.scada.web.entity.DevicePoint;
import com.ht.scada.web.service.DevicePointService;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;

/**
 *
 * @author admin
 */
@Service("devicePointService")
public class DevicePointServiceImpl implements DevicePointService{
    
    @Inject
    private DevicePointDao devicePointDao;
    
    @Override
    public List<DevicePoint> getAllDevicePoint(){
        return devicePointDao.findAll();
    }

    @Override
    public void dropDevicePoint(int id) {
        devicePointDao.delete(id);
    }
    
    @Override
    public DevicePoint findDevicePointByID(int id){
        return devicePointDao.findOne(id);
    }

    @Override
    public void saveDevicePoint(DevicePoint point){
        devicePointDao.save(point);
    }
}
