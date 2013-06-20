package com.ht.scada.web.mvc;

import com.ht.scada.security.service.UserService;
import com.ht.scada.web.entity.UserExtInfo;
import com.ht.scada.web.service.UserExtInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(value = "/test")
public class TestController {
    @Autowired
	private UserService userService;

    @Autowired
    private UserExtInfoService userExtInfoService;
    
    @RequestMapping(method = RequestMethod.GET)
    @ResponseBody
    public List<UserExtInfo> index() {
        List<UserExtInfo> list = userExtInfoService.getUserExtInfoByEndTag(34);
        return list;
    }
    
    
}
