/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ht.scada.web.entity;

import com.alibaba.fastjson.annotation.JSONField;
import com.ht.scada.common.tag.entity.EndTag;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import org.springframework.data.jpa.domain.AbstractPersistable;

@Entity
@Table(name="T_EndtagPoint")
public class EndTagPoint  extends AbstractPersistable<Integer> {
    @OneToOne
    @JoinColumn(name="endtag_id")
    private EndTag endTag;
    private String x;
    private String y;
    

    public EndTag getEndTag() {
        return endTag;
    }

    public void setEndTag(EndTag endTag) {
        this.endTag = endTag;
    }

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
    
    
}
