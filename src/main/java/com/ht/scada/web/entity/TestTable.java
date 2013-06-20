/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ht.scada.web.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import org.springframework.data.jpa.domain.AbstractPersistable;

@Entity
@Table(name="T_TestTable")
public class TestTable extends AbstractPersistable<Integer> {
    @Column(columnDefinition="DECIMAL(10,0)")
	private float oilProduct;
    
}
