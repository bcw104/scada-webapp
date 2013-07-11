package com.ht.scada.web.dao;

import com.ht.scada.web.entity.EndTagPoint;
import java.util.List;
import java.util.Set;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 *
 * @author admin
 */
public interface EndTagPointDao extends JpaRepository<EndTagPoint, Integer>{
    @Query("select distinct p from EndTagPoint p where p.endTag.id in (?1)")
    List<EndTagPoint> getPointListByIDS(Set<Integer> ids);
}
