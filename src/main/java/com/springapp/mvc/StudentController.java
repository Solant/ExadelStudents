package com.springapp.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/student")
public class StudentController {
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String studentPage(ModelMap model) {
        return "student";
    }
    @RequestMapping(value = "/saveChanges", method = RequestMethod.POST)
    public String saveChanges(){
        return "student";
    }
}