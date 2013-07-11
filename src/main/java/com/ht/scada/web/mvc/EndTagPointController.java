package com.ht.scada.web.mvc;

import com.ht.scada.security.entity.User;
import com.ht.scada.security.service.UserService;
import com.ht.scada.web.entity.EndTagPoint;
import com.ht.scada.web.entity.UserExtInfo;
import com.ht.scada.web.service.EndTagPointService;
import com.ht.scada.web.service.UserExtInfoService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/endtagpoint")
public class EndTagPointController {
    @Autowired
    private UserService userService;
    @Autowired
    private EndTagPointService endTagPointService;
    @Autowired
    private UserExtInfoService userExtInfoService;
    
    @RequestMapping(value = "list")
    @ResponseBody
    public List<Map> list(){
        User user = userService.getCurrentUser();
        UserExtInfo userEx = userExtInfoService.findUserExtInfoByUserID(user.getId());
        List<EndTagPoint> list = endTagPointService.getPointListByIDS(userEx.getEndTagID());
        List<Map> rtn = new ArrayList<>();
        for(EndTagPoint point:list){
            Map map = new HashMap();
            map.put("id", point.getEndTag().getId());
            map.put("code", point.getEndTag().getCode());
            map.put("x", point.getX());
            map.put("y", point.getY());
            rtn.add(map);
        }
        return rtn;
    }
}
