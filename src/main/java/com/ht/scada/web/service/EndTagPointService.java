package com.ht.scada.web.service;


import com.ht.scada.web.entity.EndTagPoint;
import java.util.List;
import java.util.Set;

/**
 *
 * @author admin
 */
public interface EndTagPointService {
    List<EndTagPoint> getPointList();
    
    List<EndTagPoint> getPointListByIDS(Set<Integer> ids);
    
    EndTagPoint getPointListByEndTagID(int id);
    void  savePoint(EndTagPoint endTagPoint);
}


