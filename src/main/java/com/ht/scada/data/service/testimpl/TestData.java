/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ht.scada.data.service.testimpl;

import javax.persistence.Entity;
import javax.persistence.Table;
import org.springframework.data.jpa.domain.AbstractPersistable;

@Entity
@Table(name="T_TestData")
public class TestData extends AbstractPersistable<Integer> {
    
    private String varCode;
    private String varGroup;
    private String varName;
    private String varValue;

    public String getVarCode() {
        return varCode;
    }

    public void setVarCode(String varCode) {
        this.varCode = varCode;
    }

    public String getVarGroup() {
        return varGroup;
    }

    public void setVarGroup(String varGroup) {
        this.varGroup = varGroup;
    }

    public String getVarName() {
        return varName;
    }

    public void setVarName(String varName) {
        this.varName = varName;
    }

    public String getVarValue() {
        return varValue;
    }

    public void setVarValue(String varValue) {
        this.varValue = varValue;
    }
    
    
}
