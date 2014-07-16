package com.springapp.mvc;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/student")
public class StudentController {
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String studentPage(ModelMap model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName(); //get logged in username
        model.addAttribute("account", name);
        return "student";
    }
    @RequestMapping(value = "/saveChanges", method = RequestMethod.POST)
    public String saveChanges(){
        return "student";
    }
}