package com.ht.scada.web.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/main")
public class MainController {
	@RequestMapping(method = RequestMethod.GET)
	public String main() {
		return "main/index";
	}
}
