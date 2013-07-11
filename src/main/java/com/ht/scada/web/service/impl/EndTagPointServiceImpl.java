/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ht.scada.web.service.impl;

import com.ht.scada.web.dao.EndTagPointDao;
import com.ht.scada.web.entity.EndTagPoint;
import com.ht.scada.web.service.EndTagPointService;
import java.util.List;
import java.util.Set;
import javax.inject.Inject;
import org.springframework.stereotype.Service;

/**
 *
 * @author admin
 */
@Service
public class EndTagPointServiceImpl implements EndTagPointService{
    
    @Inject
    private EndTagPointDao endTagPointDao;
    
    @Override
    public List<EndTagPoint> getPointList() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<EndTagPoint> getPointListByIDS(Set<Integer> ids) {
        return endTagPointDao.getPointListByIDS(ids);
    }
    
}
