package com.springapp.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public String loginPage(ModelMap model) {
        return "login";
    }

    @RequestMapping(value = "/access_deny", method = RequestMethod.GET)
    public String adminPage(ModelMap model) {
        return "error403";
    }
}