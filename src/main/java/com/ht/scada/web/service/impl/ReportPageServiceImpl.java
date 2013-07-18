package com.ht.scada.web.service.impl;

import com.ht.scada.security.dao.UserDao;
import com.ht.scada.web.dao.ReportPageDao;
import com.ht.scada.web.entity.UserExtInfo;
import com.ht.scada.web.dao.UserExtInfoDao;
import com.ht.scada.web.entity.ReportPage;
import com.ht.scada.web.service.ReportPageService;
import com.ht.scada.web.service.UserExtInfoService;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author admin
 */
@Transactional
@Service("reportPageService")
public class ReportPageServiceImpl implements ReportPageService {

    @Inject
    private ReportPageDao reportPageDao;

    @Override
    public List<ReportPage> getAllReportPage() {

        return reportPageDao.findAll();
    }
}
