/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ht.scada.web.service;

import com.ht.scada.common.tag.entity.AcquisitionDevice;
import java.util.List;

public interface AcquisitionDeviceWebService {
     
    /**
     * 获得采集设备(RTU)
     * @return 
     */
    List<AcquisitionDevice> getAcquisitionDeviceList();
}
