package com.springapp.mvc;

import com.springsecurity.provider.SecurityChecker;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller

public class HelloController {
    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public String welcomePage(ModelMap model) {
        if (SecurityChecker.hasRole("ROLE_STUDENT"))
            return "redirect:student";
        return "index";
	}
}