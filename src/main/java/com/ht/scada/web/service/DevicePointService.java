/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ht.scada.web.service;

import com.ht.scada.web.entity.DevicePoint;
import java.util.List;

/**
 *
 * @author admin
 */
public interface DevicePointService {

    List<DevicePoint> getAllDevicePoint();
    void dropDevicePoint(int id);

    DevicePoint findDevicePointByID(int id);

    void saveDevicePoint(DevicePoint point);
}
