package com.springapp.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user/{userId}")
public class HelloController {


    @RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		return "index";
	}
}