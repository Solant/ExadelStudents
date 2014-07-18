package com.springapp.mvc;

import com.springsecurity.provider.SecurityChecker;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller

public class HelloController {
    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public String welcomePage(ModelMap model,HttpSession session) {
        session.setAttribute("account", SecurityContextHolder.getContext().getAuthentication().getName());
        if (SecurityChecker.hasRole("ROLE_STUDENT"))
            return "redirect:student";
        if (SecurityChecker.hasRole("ROLE_CURATOR"))
            return "redirect:curator";
        if (SecurityChecker.hasRole("ROLE_WORKER"))
            return "redirect:worker";

        return "login";
    }
}