/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ht.scada.data.service.testimpl;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 *
 * @author admin
 */
public interface TestDataDao  extends JpaRepository<TestData,Integer>{
    @Query("select t from TestData t where t.varCode=?1 and t.varGroup=?2")
	public List<TestData> findByCodeGroup(String code,String group);
    @Query("select t from TestData t where t.varCode=?1 and t.varName=?2")
	public List<TestData> findByCodeName(String code,String name);
}
