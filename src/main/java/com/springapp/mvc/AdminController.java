package com.springapp.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

/**
 * Created by Надя on 16.07.2014.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String workerPage(ModelMap model) {
        return "admin";
    }
    @RequestMapping(value = "/returnCreate", method = RequestMethod.GET)
    public String showCreate(){
        return "create";
    }

    @RequestMapping(value = "/createUser", method = RequestMethod.POST)
    public String createUser(HttpSession session){
        //session.setAttribute("account", newName);
        return "redirect:/admin";
    }

    @RequestMapping(value = "/linkStudent", method = RequestMethod.GET)
    public String linkStudentCurator(){
        return "linking";
    }


    @RequestMapping(value = "/firedStudents", method = RequestMethod.POST)
    public String firedStudents(){
        return "";
    }

    @RequestMapping(value = "/formTable", method = RequestMethod.POST)
    public String formTable(){
        return "feedbacker";
    }

}