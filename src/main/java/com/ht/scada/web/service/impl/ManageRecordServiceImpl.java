package com.ht.scada.web.service.impl;

import com.ht.scada.data.entity.YkRecord;
import com.ht.scada.data.entity.YtRecord;
import com.ht.scada.security.entity.User;
import com.ht.scada.web.dao.YkRecordDao;
import com.ht.scada.web.dao.YtRecordDao;
import com.ht.scada.web.service.ManageRecordService;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;

@Transactional
@Service("manageRecordService")
public class ManageRecordServiceImpl implements ManageRecordService {

    @Inject
    private YkRecordDao ykRecordDao;
    @Inject
    private YtRecordDao ytRecordDao;

    @Override
    public YkRecord saveYk(YkRecord record){
        
        return ykRecordDao.save(record);
    }
    
    @Override
    public List<YtRecord> saveYt(List<YtRecord> lstRecord){
        
        return ytRecordDao.save(lstRecord);
    }
    
    @Override
    public YtRecord getYt(String strCode, String strTagName, User user){
        return ytRecordDao.getYt(strCode, strTagName, user);
    }
}
