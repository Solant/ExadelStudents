package com.springapp.mvc;

import com.View.AccountUnit;
import com.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import persistance.model.Notification;
import persistance.model.User;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller

public class HelloController {
    @Autowired
    private UserService us;

    @Autowired
    private AdministratorService administratorService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private NotificationService notificationService;

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
        session.setAttribute("notifNumber", us.getAllUnreadNotifications(UserService.getCurrentUserLogin()).size());
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
        User user = us.getByLogin(login);
        AccountUnit accountUnit = new AccountUnit();
        accountUnit.setFirstName(user.getFirstName());
        accountUnit.setLogin(login);
        accountUnit.setSecondName(user.getSecondName());
        accountUnit.setEmail(user.getEmail());
        accountUnit.setSkype(user.getSkype());
        accountUnit.setTelephone(user.getTelephone());
        modelMap.addAttribute("accountUnit", accountUnit);
        return "account";
    }

    @RequestMapping(value = "/changePassword", method = RequestMethod.POST)
    public String changePassword(ModelMap modelMap, @ModelAttribute("accountUnit")AccountUnit accountUnit) {
        String message = new String();
        //System.out.println(UserService.stringToSha256(accountUnit.getPassword()) + " " + us.getPassword(UserService.getCurrentUserLogin()));
        if(UserService.stringToSha256(accountUnit.getPassword()).equals(us.getPassword(UserService.getCurrentUserLogin()))){
            if(accountUnit.getNewPassword().equals(accountUnit.getConfirmedPassword()) && !accountUnit.getNewPassword().equals("")) {
                us.setPassword(UserService.getCurrentUserLogin() ,accountUnit.getNewPassword());
                message = "Password was changed.";
            }
            else{
                message = "Confirmed password doesn't match the new one.";
            }
            User user = us.getByLogin(UserService.getCurrentUserLogin());
            user.setEmail(accountUnit.getEmail());
            user.setSkype(accountUnit.getSkype());
            user.setTelephone(accountUnit.getTelephone());
            us.update(user);
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

    @RequestMapping(value = "/notif", method = RequestMethod.GET)
    public String showNotifs(ModelMap modelMap){
        List<Notification> notifications = us.getAllNotifications(UserService.getCurrentUserLogin());
        modelMap.addAttribute("notifs", notifications);
        return "notificationList";
    }

    @RequestMapping(value = "/notif/{notifId}", method = RequestMethod.GET)
    public String showNotif(ModelMap modelMap, @PathVariable("notifId")Long id){
        Notification notification = notificationService.getNotificationById(id);
        notificationService.setRead(id);
        modelMap.addAttribute("notif", notification);
        return "notification";
    }

    @Autowired
    private AttributeService attributeService;

    @Autowired
    private GroupService groupService;

    @Autowired
    private TechnologyService technologyService;

    @Autowired
    private FeedbackerService feedbackerService;


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

        //studentService.addInterviewer("interviewer", "student1");

       /* technologyService.add("java");
        technologyService.add("js");*/

//       feedbackerService.addTechnology("curator", "java");
       // return "notificationList";

        notificationService.add("system", "student", "wtestNotif", "some text here");


    }
}