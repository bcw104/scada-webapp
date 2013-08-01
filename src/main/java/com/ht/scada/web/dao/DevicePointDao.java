/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ht.scada.web.dao;

import com.ht.scada.web.entity.DevicePoint;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author admin
 */
public interface DevicePointDao extends JpaRepository<DevicePoint, Integer>{
    
}
