/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ht.scada.web.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import org.springframework.data.jpa.domain.AbstractPersistable;

@Entity
@Table(name="T_DevicePoint")
public class DevicePoint extends AbstractPersistable<Integer> {
    private String x;
    private String y;
    @ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="parent_id")
	private DevicePoint parent;
    private String deviceType;
    private String deviceName;
    private String endTagCode="";

    public String getX() {
        return x;
    }

    public void setX(String x) {
        this.x = x;
    }

    public String getY() {
        return y;
    }

    public void setY(String y) {
        this.y = y;
    }

    public DevicePoint getParent() {
        return parent;
    }

    public void setParent(DevicePoint parent) {
        this.parent = parent;
    }

    public String getDeviceType() {
        return deviceType;
    }

    public void setDeviceType(String deviceType) {
        this.deviceType = deviceType;
    }

    public String getDeviceName() {
        return deviceName;
    }

    public void setDeviceName(String deviceName) {
        this.deviceName = deviceName;
    }

    public String getEndTagCode() {
        return endTagCode;
    }

    public void setEndTagCode(String endTagCode) {
        this.endTagCode = endTagCode;
    }
    
    
}
