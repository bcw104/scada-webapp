package com.ht.scada.web.service.impl;

import com.ht.scada.common.tag.entity.AcquisitionDevice;
import com.ht.scada.web.dao.AcquisitionDeviceWebDao;
import com.ht.scada.web.service.AcquisitionDeviceWebService;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;

@Transactional
@Service("acquisitionDeviceWebService")
public class AcquisitionDeviceWebServiceImpl implements AcquisitionDeviceWebService {

    @Inject
    private AcquisitionDeviceWebDao acquisitionDeviceDao;

    @Override
    public List<AcquisitionDevice> getAcquisitionDeviceList(){
        return acquisitionDeviceDao.getAcquisitionDeviceList();
    }
}
