package com.springapp.mvc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.TestService;

@Controller
public class HelloController {

    @Autowired
    private TestService ts;


    @RequestMapping(value = {"/test"}, method = RequestMethod.GET)
	public void welcomePage() {
		//ModelAndView model = new ModelAndView();
        // model.setViewName("index");
        //return model;
        ts.testMethod();

	}
}