package com.ht.scada.web.mvc;

import com.ht.scada.common.tag.entity.AcquisitionDevice;
import com.ht.scada.security.service.UserService;
import com.ht.scada.web.service.AcquisitionDeviceWebService;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 生产管理页面操作
 * @author Administrator
 */
@Controller
@RequestMapping(value = "/produce")
public class ProduceController {
    
    private static final Logger log = LoggerFactory.getLogger(RegisterController.class);	
    
    @Autowired
	private UserService userService;
    @Autowired
    private AcquisitionDeviceWebService acquisitionDeviceService;
    
    @RequestMapping(value="deviceList")
    @ResponseBody
    public List<AcquisitionDevice> deviceList(){
        
        List<AcquisitionDevice> lstRusult = new ArrayList<>();
        lstRusult = acquisitionDeviceService.getAcquisitionDeviceList();
        return lstRusult;
    }
}
