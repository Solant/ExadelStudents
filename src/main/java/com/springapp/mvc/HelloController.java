package com.springapp.mvc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import service.TestService;

@Controller
public class HelloController {
	@RequestMapping(value = {"/"}, method = RequestMethod.GET)
	public ModelAndView welcomePage222() {
		ModelAndView model = new ModelAndView();
        model.setViewName("index");
        return model;
	}

    @Autowired
    private TestService ts;

    @RequestMapping(value = {"/test"}, method = RequestMethod.GET)
    public void welcomePage() {
        ts.testMethod();

    }
}