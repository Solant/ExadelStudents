package com.springapp.mvc;

import com.View.AccountUnit;
import com.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.TestService;

import javax.servlet.http.HttpSession;

@Controller

public class HelloController {
    @Autowired
    private UserService us;

    @Autowired
    private AdministratorService administratorService;

    @Autowired
    private StudentService studentService;

   /* @RequestMapping(value = {"*/

    /**
     * "}, method = RequestMethod.GET)
     * public void start(HttpSession session) {
     * session.setAttribute("account", us.getCurrentUserLogin());
     * }
     */

    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public String welcomePage(ModelMap model, HttpSession session) {
        session.setAttribute("account", us.getCurrentUserLogin());
        if (SecurityService.hasRole("ROLE_STUDENT"))
            return "redirect:student/" + us.getCurrentUserLogin();
        if (SecurityService.hasRole("ROLE_CURATOR"))
            return "redirect:curator/" + us.getCurrentUserLogin();
        if (SecurityService.hasRole("ROLE_ADMIN"))
            return "redirect:admin";

        return "login";
    }

    @RequestMapping(value = "/account", method = RequestMethod.GET)
    public String account(ModelMap modelMap) {
        String login = UserService.getCurrentUserLogin();
        AccountUnit accountUnit = new AccountUnit();
        accountUnit.setFirstName(us.getFirstName(login));
        accountUnit.setLogin(login);
        accountUnit.setSecondName(us.getSecondName(login));
        modelMap.addAttribute("accountUnit", accountUnit);
        return "account";
    }

    @RequestMapping(value = "/changePassword", method = RequestMethod.POST)
    public String changePassword(ModelMap modelMap, @ModelAttribute("accountUnit")AccountUnit accountUnit) {
        String message = new String();
        if(accountUnit.getPassword().equals(us.getPassword(UserService.getCurrentUserLogin()))){
            if(accountUnit.getNewPassword().equals(accountUnit.getConfirmedPassword())) {
                us.setPassword(UserService.getCurrentUserLogin() ,accountUnit.getNewPassword());
                message = "Password was changed.";
            }
            else{
                message = "Confirmed password doesn't match the new one.";
            }
        }
        else{
            message = "Wrong old password.";
        }
        accountUnit.setPassword("");
        accountUnit.setNewPassword("");
        accountUnit.setConfirmedPassword("");
        modelMap.addAttribute("message", message);
        modelMap.addAttribute("accountUnit", accountUnit);
        return "account";
    }

    @Autowired
    private TestService ts;

    @Autowired
    private AttributeService attributeService;

    @Autowired
    private GroupService groupService;


    @RequestMapping(value = {"/test"}, method = RequestMethod.GET)
    public void welcomePage() {/*
        groupService.addGroup("service", "service");
        attributeService.addAttribute("service", "status", "notShow");
        studentService.add("student", "123", "Ivan", "Ivanov", "STUDYING");
        administratorService.add("admin", "123", "Petr", "Petrov");
        ts.testMethod();*/

        /*System.out.println("test started");
        ArrayList<GAVPresentation> values =  new ArrayList<GAVPresentation>();
        GAVPresentation gav = new GAVPresentation();
        gav.setGroup("Institution");
        gav.setAttribute("University");
        gav.setValue("BSU");
        values.add(gav);

        GAVPresentation gav1 = new GAVPresentation();
        gav1.setGroup("Institution");
        gav1.setAttribute("Faculty");
        gav1.setValue("FAMCS");
        values.add(gav1);

        GAVPresentation gav2 = new GAVPresentation();
        gav2.setGroup("Work");
        gav2.setAttribute("Project");
        gav2.setValue("some");
        values.add(gav2);

        studentService.setValues("student", values);

        System.out.println("test ended");*/

        studentService.addInterviewer("interviewer", "student1");

    }
}