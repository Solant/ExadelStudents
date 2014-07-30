package com.springapp.mvc;

import com.View.UserUnit;
import com.services.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Надя on 16.07.2014.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private StudentService studentService;

    /*@Autowired
    private FeedbackerService feedbackerService;

    @Autowired
    private AdministratorService administratorService;*/

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String workerPage(ModelMap model) {
        return "/admin.jsp";
    }

    @RequestMapping(value = "/returnCreate", method = RequestMethod.GET)
    public String returnCreate(ModelMap model){
        model.addAttribute("newUser", new UserUnit());
        return "create";
    }

    @RequestMapping(value = "/createUser", method = RequestMethod.POST)
    public String createUser(@ModelAttribute("newUser") UserUnit newUser){
        if(newUser.getRole().equals("Student"))
            studentService.add(newUser.getLogin(), newUser.getPassword(), newUser.getFirstname(), newUser.getLastname());
        /*if(newUser.getRole().equals("Feedbacker"))
            feedbackerService.add(newUser.getLogin(), newUser.getPassword(), newUser.getFirstname(), newUser.getLastname());
        if(newUser.getRole().equals("Student"))
            administratorService.add(newUser.getLogin(), newUser.getPassword(), newUser.getFirstname(), newUser.getLastname());*/
        return "/admin.jsp";
    }


    @RequestMapping(value = "/linkStudent", method = RequestMethod.GET)
    public String linkStudentCurator(){
        return "linking";
    }


    @RequestMapping(value = "/firedStudents", method = RequestMethod.POST)
    public String firedStudents(){
        return "";
    }

    @RequestMapping(value = "/formTable", method = RequestMethod.GET)
    public String formTable(){
        return "/adminTable";
    }

}