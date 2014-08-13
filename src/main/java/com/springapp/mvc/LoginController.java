package com.springapp.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public String loginPage(ModelMap model, @RequestParam("error")String error) {
        model.addAttribute("error", error);
        return "login";
    }

    @RequestMapping(value = "/access_deny", method = RequestMethod.GET)
    public String adminPage() {
        return "error403";
    }
}