package com.springapp.mvc;

import com.forView.AccountUnit;
import com.forView.validators.AccountFormValidator;
import com.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import persistance.model.Notification;
import persistance.model.User;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
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
    private AccountFormValidator accountFormValidator;

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
        if (SecurityService.hasRole("ROLE_STUDENT")) {
            session.setAttribute("account", us.getCurrentUserLogin());
            session.setAttribute("notifNumber", us.getAllUnreadNotifications(UserService.getCurrentUserLogin()).size());
            session.setAttribute("firstName", us.getFirstName(UserService.getCurrentUserLogin()));
            session.setAttribute("secondName", us.getSecondName(UserService.getCurrentUserLogin()));
            return "redirect:student/" + us.getCurrentUserLogin();
        }
        if (SecurityService.hasRole("ROLE_CURATOR")) {
            session.setAttribute("account", us.getCurrentUserLogin());
            session.setAttribute("notifNumber", us.getAllUnreadNotifications(UserService.getCurrentUserLogin()).size());
            session.setAttribute("firstName", us.getFirstName(UserService.getCurrentUserLogin()));
            session.setAttribute("secondName", us.getSecondName(UserService.getCurrentUserLogin()));
            return "redirect:curator/" + us.getCurrentUserLogin();
        }
        if (SecurityService.hasRole("ROLE_ADMIN")) {
            session.setAttribute("account", us.getCurrentUserLogin());
            session.setAttribute("notifNumber", us.getAllUnreadNotifications(UserService.getCurrentUserLogin()).size());
            session.setAttribute("firstName", us.getFirstName(UserService.getCurrentUserLogin()));
            session.setAttribute("secondName", us.getSecondName(UserService.getCurrentUserLogin()));
            return "redirect:admin";
        }

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
    public String changePassword(ModelMap modelMap, @Valid @ModelAttribute("accountUnit") AccountUnit accountUnit, BindingResult result) {
        accountUnit.setLogin(UserService.getCurrentUserLogin());
        accountFormValidator.validate(accountUnit, result);
        if (!result.hasErrors()) {
            if(!accountUnit.getNewPassword().equals("") &&
                    accountUnit.getNewPassword()!=null) {
                us.setPassword(UserService.getCurrentUserLogin() ,accountUnit.getNewPassword());
            }
            User user = us.getByLogin(UserService.getCurrentUserLogin());
            user.setEmail(accountUnit.getEmail());
            user.setSkype(accountUnit.getSkype());
            user.setTelephone(accountUnit.getTelephone());
            us.update(user);

            modelMap.addAttribute("accountUnit", accountUnit);
        }
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

       // notificationService.add("system", "student", "wtestNotif", "some text here");

      /* groupService.addGroup("Institution", "for_everybody");
        attributeService.addAttribute("Institution", "Institution", "select", "BSU;BSUIR;BNTU;MIU;GRSU;VITGTK");
        attributeService.addAttribute("Institution", "Specialty", "text", null);*/
//        attributeService.addAttribute("Institution", "Faculty", "text", null);
//        attributeService.addAttribute("Institution", "Course", "select", "1;2;3;4;5");
//        attributeService.addAttribute("Institution", "Group", "text", null);
        /*attributeService.addAttribute("Institution", "Graduating year", "select", "2014;2015;2016;2017;2018;2019;2020");

        groupService.addGroup("Project", "WORKING");
        attributeService.addAttribute("Project", "Current project", "text", null);
        attributeService.addAttribute("Project", "Role on current project", "select", "junior;developer;tester");
        attributeService.addAttribute("Project", "Team Lead on current project", "text", null);
        attributeService.addAttribute("Project", "Project Manager on current project", "text", null);
        attributeService.addAttribute("Project", "Curator", "text", null);
        attributeService.addAttribute("Project", "Technologies on current project", "select", "Java;CSS;HTML");
        attributeService.addAttribute("Project", "Desire to change project", "select", "Yes;No");

        groupService.addGroup("Probation", "STUDYING");
        attributeService.addAttribute("Probation", "Invitation to work", "select", "Yes;No");
        attributeService.addAttribute("Probation", "Practice/Probation", "select", "Practice;Probation");
        attributeService.addAttribute("Probation", "Date of practice start", "date", null);
        attributeService.addAttribute("Probation", "Date of practice finish", "date", null);
        attributeService.addAttribute("Probation", "Curator in Exadel", "text", null);

        groupService.addGroup("Skills", "for_everybody");
        attributeService.addAttribute("Skills", "Certificates", "textarea", null);
        attributeService.addAttribute("Skills", "Current Technologies", "select", "Java;CSS;HTML");
        attributeService.addAttribute("Skills", "English Level", "select", "Beginner;Elementary;Pre-Intermediate;Intermediate;Upper-Intermediate;Advanced");
        attributeService.addAttribute("Skills", "Desired technologies to work with", "select", "Java;CSS;HTML");

        groupService.addGroup("Work", "WORKING");
        attributeService.addAttribute("Work", "Hire date", "date", null);
        attributeService.addAttribute("Work", "Course when was employed", "select", "1;2;3;4;5");
        attributeService.addAttribute("Work", "Number of hours you're working now(week)", "select", "10;15;20;25;30;35;40");
        attributeService.addAttribute("Work", "Pre-empoloyment training in Exadel","select","Yes;No");
        attributeService.addAttribute("Work", "Number of hours you want to work(week)", "select", "10;15;20;25;30;35;40");
        attributeService.addAttribute("Work", "Last projects", "textarea", null);
        attributeService.addAttribute("Work", "Billable", "select", "Yes;No");
        attributeService.addAttribute("Work", "Another vacation(type, date)", "textarea", null);
        attributeService.addAttribute("Work", "Trainings in Exadel (which - when)", "textarea", null);*/

        List<ArrayList<String>> listListov = new ArrayList<ArrayList<String>>();
        ArrayList<String> temp1 = new ArrayList<String>();
        temp1.add("temp1");
        ArrayList<String> temp2 = new ArrayList<String>();
        temp2.add("temp2");

        listListov.add(temp1);
        listListov.add(temp2);


        System.out.println(listListov.size());
        System.out.println(listListov.get(1).get(0));

        System.out.println(listListov.remove(1).get(0));

        System.out.println(listListov.size());

    }
}