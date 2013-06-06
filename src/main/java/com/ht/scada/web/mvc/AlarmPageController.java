package com.ht.scada.web.mvc;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/alarmpage")
public class AlarmPageController {
    
	private static final Logger log = LoggerFactory.getLogger(RegisterController.class);	
    
	@RequestMapping(method = RequestMethod.GET)
	public String main() {

        return "alarm/bjxix";
	}
}
