package com.ht.scada.web.mvc;

import com.ht.scada.common.tag.service.EndTagService;
import com.ht.scada.security.entity.User;
import com.ht.scada.security.service.UserService;
import com.ht.scada.web.entity.UserExtInfo;
import com.ht.scada.web.service.UserExtInfoService;
import java.util.ArrayList;
import java.util.List;
import net.sf.json.JSONSerializer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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
        String aaa = JSONSerializer.toJSON(list).toString();
        return list;
    }
    
    
}
