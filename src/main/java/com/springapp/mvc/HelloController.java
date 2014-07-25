package com.springapp.mvc;

import com.services.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.TestService;

import javax.servlet.http.HttpSession;

@Controller

public class HelloController {
    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public String welcomePage(ModelMap model,HttpSession session) {
        session.setAttribute("account", SecurityContextHolder.getContext().getAuthentication().getName());
        if (SecurityService.hasRole("ROLE_STUDENT"))
            return "redirect:student";
        if (SecurityService.hasRole("ROLE_CURATOR"))
            return "redirect:curator";
        if (SecurityService.hasRole("ROLE_ADMIN"))
            return "redirect:admin";

        return "login";
    }
    @RequestMapping(value = "/account", method = RequestMethod.GET)
    public String account(){
        return "account";
    }
    @Autowired
    private TestService ts;

    @RequestMapping(value = {"/test"}, method = RequestMethod.GET)
    public void welcomePage() {
        ts.testMethod();

    }
}