/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ht.scada.web.dao;

import com.ht.scada.common.tag.entity.AcquisitionDevice;
import com.ht.scada.web.entity.MenuItem;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 *
 * @author Administrator
 */
public interface AcquisitionDeviceWebDao extends JpaRepository<MenuItem, Integer>{
    
    /**
     * 获得采集设备(RTU)
     * @return 
     */   
    @Query("SELECT u FROM AcquisitionDevice u")
	public List<AcquisitionDevice> getAcquisitionDeviceList();
}
