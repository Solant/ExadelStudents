package com.springapp.mvc;

import com.services.AdministratorService;
import com.services.SecurityService;
import com.services.StudentService;
import com.services.UserService;
import com.services.presentation.GAVPresentation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.TestService;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller

public class HelloController {
    @Autowired
    private UserService us;

    @Autowired
    private AdministratorService administratorService;

    @Autowired
    private StudentService studentService;

   /* @RequestMapping(value = {"*//**"}, method = RequestMethod.GET)
    public void start(HttpSession session) {
        session.setAttribute("account", us.getCurrentUserLogin());
    }*/

    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public String welcomePage(ModelMap model,HttpSession session) {
        session.setAttribute("account", us.getCurrentUserLogin());
        if (SecurityService.hasRole("ROLE_STUDENT"))
            return "redirect:student/"+us.getCurrentUserLogin();
        if (SecurityService.hasRole("ROLE_CURATOR"))
            return "redirect:curator";
        if (SecurityService.hasRole("ROLE_ADMIN"))
            return "redirect:admin";

        return "login";
    }
    @RequestMapping(value = "/account", method = RequestMethod.GET)
    public String account(){
        UserService.getCurrentUserLogin();

        return "account";
    }

    @Autowired
    private TestService ts;



    @RequestMapping(value = {"/test"}, method = RequestMethod.GET)
    public void welcomePage() {
        //ts.testMethod();
        ArrayList<GAVPresentation> values =  new ArrayList<GAVPresentation>();
        GAVPresentation gav = new GAVPresentation();
        gav.setGroup("Institution");
        gav.setAttribute("University");
        gav.setValue("BSU");
        values.add(gav);

        gav.setGroup("Institution");
        gav.setAttribute("Faculty");
        gav.setValue("FAMCS");
        values.add(gav);

        gav.setGroup("Work");
        gav.setAttribute("Project");
        gav.setValue("some");
        values.add(gav);

        studentService.setValues("student", values);
    }
}