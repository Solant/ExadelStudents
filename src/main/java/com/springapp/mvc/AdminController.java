package com.springapp.mvc;


import com.forView.*;
import com.forView.Group;
import com.forView.validators.AccountFormValidator;
import com.forView.validators.UserFormValidator;
import com.services.*;
import com.services.mail.MailService;
import com.services.presentation.GAVPresentation;
import com.services.tables.ExcelTableService;
import com.services.tables.PDFTableService;
import com.services.tables.WordTableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import persistance.model.*;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.io.OutputStream;
import java.util.*;

/**
 * Created by Надя on 16.07.2014.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private StudentService studentService;

    @Autowired
    private FeedbackerService feedbackerService;

    @Autowired
    private AdministratorService administratorService;

    @Autowired
    private AttributeService attributeService;

    @Autowired
    private HRWorkerService hrWorkerService;

    @Autowired
    private UserService userService;

    @Autowired
    private AccountFormValidator accountFormValidator;

    @Autowired
    private NotificationService notificationService;

    @Autowired
    private GroupService groupService;

    @Autowired
    private TechnologyService technologyService;

    @Autowired
    private UserFormValidator userFormValidator;

    @Autowired
    private ReviewService reviewService;

    private List<List<String>> tableData;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String workerPage(ModelMap modelMap) {
        ArrayList<GAVPresentation> gav = (ArrayList<GAVPresentation>) attributeService.getAllAttributes();
        GroupedValues groupedValues = new GroupedValues();

        List<GAVPresentation> internal;
        ArrayList<String> groups = new ArrayList<String>();
        for (int j = 0; gav.size() > 0; j++) {
            internal = new ArrayList<GAVPresentation>();
            GAVPresentation temp = gav.remove(0);
            internal.add(temp);
            for (int i = 0; i < gav.size(); i++) {
                if (gav.get(i).getGroup().equals(temp.getGroup())) {
                    internal.add(gav.get(i));
                    gav.remove(i--);
                }
            }
            groups.add(temp.getGroup());
            Group internalGroup = new Group();
            internalGroup.setGavs(internal);
            groupedValues.getValuesArray().add(internalGroup);
        }
        modelMap.addAttribute("groups", groups);
        modelMap.addAttribute("groupedValues", groupedValues);
        return "admin";
    }

    @RequestMapping(value = "/returnCreate", method = RequestMethod.GET)
    public String returnCreate(ModelMap model) {
        model.addAttribute("newUser", new UserUnit());
        return "create";
    }

    @RequestMapping(value = "/createUser", method = RequestMethod.POST)
    public String createUser(ModelMap modelMap, @Valid @ModelAttribute("newUser") UserUnit newUser, BindingResult result) {
        userFormValidator.validate(newUser, result);
        if (result.hasErrors())
            return "create";
        else {
            if (newUser.getRole().toString().equals("Student"))
                studentService.add(newUser.getLogin(), newUser.getPassword(), newUser.getFirstname(), newUser.getLastname(), "STUDYING");
            if (newUser.getRole().toString().equals("Feedbacker"))
                feedbackerService.add(newUser.getLogin(), newUser.getPassword(), newUser.getFirstname(), newUser.getLastname());
            if (newUser.getRole().toString().equals("Admin"))
                administratorService.add(newUser.getLogin(), newUser.getPassword(), newUser.getFirstname(), newUser.getLastname());
            if (tableData == null)
                return "redirect:/admin";
            modelMap.addAttribute("tableData", tableData);
            return "adminTable";
        }
    }


    @RequestMapping(value = "/showLinkStudent", method = RequestMethod.GET)
    public String showLinkStudent(ModelMap modelMap) {
        LinkUnit linkUnit = new LinkUnit();
        modelMap.addAttribute("students", studentService.getAllEnabledStudents());
        List<String> technologies = new ArrayList<String>();
        Map<String, Set<Feedbacker>> feedbackerMap = new HashMap<String, Set<Feedbacker>>();
        technologies.add("java");
        technologies.add("js");
        for (String tech : technologies) {
            feedbackerMap.put(tech, feedbackerService.getFeedbackersByTechnology(tech));
        }
        modelMap.addAttribute("feedbackerMap", feedbackerMap);
        modelMap.addAttribute("technologies", technologies);
        modelMap.addAttribute("linkUnit", linkUnit);
        return "linking";
    }

    @RequestMapping(value = "/linkStudent", method = RequestMethod.POST)
    public String linkStudentCurator(@ModelAttribute("linkUnit") LinkUnit linkUnit, ModelMap modelMap) {
        if (linkUnit.isCurator()) {
            for (String student : linkUnit.getStudents()) {
                for (String feed : linkUnit.getFeedbackers()) {
                    studentService.addCurator(feed, student);
                }
            }
        } else {
            for (String student : linkUnit.getStudents()) {
                for (String feed : linkUnit.getFeedbackers()) {
                    studentService.addInterviewer(feed, student);
                }
            }
        }
        if (tableData == null)
            return "redirect:/admin";
        modelMap.addAttribute("tableData", tableData);
        return "adminTable";
    }


    @RequestMapping(value = "/formTable", method = RequestMethod.POST)
    public String formTable(ModelMap modelMap,
                            ModelAndView modelAndView,
                            @ModelAttribute("groupedValues") GroupedValues groupedValues) {
        ArrayList<GAVPresentation> values = new ArrayList<GAVPresentation>();
        for (Group group : groupedValues.getValuesArray())
            values.addAll(group.getGavs());
        tableData = studentService.find(values);
        modelMap.addAttribute("tableData", tableData);
        modelMap.addAttribute("enable", "enable");
        return "/adminTable";
    }

    @RequestMapping(value = "/exportWord", method = RequestMethod.GET)
    public String exportWord(HttpServletResponse response) {
        WordTableService wts = new WordTableService("Students' table");

        for (List<String> row : tableData) {
            wts.addNewRow();
            for (String item : row)
                wts.addNewCell(item);
        }
        wts.addDateAsString();

        response.setHeader("Content-Disposition", "attachment;filename=table.doc");
        OutputStream os = null;
        try {
            os = response.getOutputStream();
        } catch (IOException e) {
            e.printStackTrace();
        }
        wts.writeInStream(os);
        return "";
    }

    @RequestMapping(value = "/exportExcel", method = RequestMethod.GET)
    public String exportExcel(HttpServletResponse response) {
        ExcelTableService ets = new ExcelTableService();

        for (List<String> row : tableData) {
            ets.addNewRow();
            for (String item : row)
                ets.addNewCell(item);
        }
        ets.addDateAsString();

        response.setHeader("Content-Disposition", "attachment;filename=table.xls");
        OutputStream os = null;
        try {
            os = response.getOutputStream();
        } catch (IOException e) {
            e.printStackTrace();
        }
        ets.writeInStream(os);
        return "";
    }

    @RequestMapping(value = "/exportPDF", method = RequestMethod.GET)
    public String exportPDF(HttpServletResponse response) {

        response.setHeader("Content-Disposition", "attachment;filename=table.pdf");
        OutputStream os = null;
        try {
            os = response.getOutputStream();
        } catch (IOException e) {
            e.printStackTrace();
        }

        PDFTableService pdfts = new PDFTableService(tableData.get(0).size(), os, true);

        for (List<String> row : tableData) {
            for (String item : row)
                pdfts.addNewCell(item);
        }

        pdfts.finishWritingInStream();


        return "";
    }

    @RequestMapping("/studentPage/{student}")
    public String studentPage(@PathVariable("student") String current, ModelMap modelMap) {
        ArrayList<GAVPresentation> gav = (ArrayList<GAVPresentation>) studentService.getValues(current);
        System.out.println(gav.size());
        GroupedValues groupedValues = new GroupedValues();


        List<GAVPresentation> internal;
        ArrayList<String> groups = new ArrayList<String>();
        for (int j = 0; gav.size() > 0; j++) {
            internal = new ArrayList<GAVPresentation>();
            GAVPresentation temp = gav.remove(0);
            internal.add(temp);
            for (int i = 0; i < gav.size(); i++) {
                if (gav.get(i).getGroup().equals(temp.getGroup())) {
                    internal.add(gav.get(i));
                    gav.remove(i--);
                }
            }
            groups.add(temp.getGroup());
            Group internalGroup = new Group();
            internalGroup.setGavs(internal);
            groupedValues.getValuesArray().add(internalGroup);
        }
        UserUnit currentUser = new UserUnit();
        currentUser.setLogin(current);
        currentUser.setFirstname(studentService.getFirstName(current));
        currentUser.setLastname(studentService.getSecondName(current));
        modelMap.addAttribute("groups", groups);
        modelMap.addAttribute("groupedValues", groupedValues);
        modelMap.addAttribute("currentUser", currentUser);
        return "studentForAdmin";
    }

    @RequestMapping("/{student}/account")
    public String studentAccount(@PathVariable("student") String student, ModelMap modelMap) {
        User user = userService.getByLogin(student);
        AccountUnit accountUnit = new AccountUnit();
        accountUnit.setFirstName(user.getFirstName());
        accountUnit.setLogin(student);
        accountUnit.setSecondName(user.getSecondName());
        accountUnit.setEmail(user.getEmail());
        accountUnit.setSkype(user.getSkype());
        accountUnit.setTelephone(user.getTelephone());
        accountUnit.setPassword(user.getPassword());
        modelMap.addAttribute("status", studentService.getStatus(student));
        modelMap.addAttribute("accountUnit", accountUnit);
        return "studentAccount";
    }

    @RequestMapping("/{student}/changeCommon")
    public String studentChangeCommon(@PathVariable("student") String student,
                                      ModelMap modelMap,
                                      @ModelAttribute("status") String status,
                                      @Valid @ModelAttribute("accountUnit") AccountUnit accountUnit,
                                      BindingResult result) {
        accountFormValidator.validate(accountUnit, result);
        User user = userService.getByLogin(student);
        user.setEmail(accountUnit.getEmail());
        user.setSkype(accountUnit.getSkype());
        user.setTelephone(accountUnit.getTelephone());
        studentService.setStatus(student, status);
        userService.update(user);
        accountUnit.setLogin(student);
        modelMap.addAttribute("accountUnit", accountUnit);
        modelMap.addAttribute("status", status);
        return "studentAccount";
    }

    @RequestMapping(value = "/studentPage/{student}/saveChanges", method = RequestMethod.POST)
    public String saveChanges(@ModelAttribute("groupedValues") GroupedValues groupedValues,
                              @PathVariable("student") String current,
                              ModelMap modelMap) {
        ArrayList<GAVPresentation> values = new ArrayList<GAVPresentation>();
        for (Group group : groupedValues.getValuesArray())
            values.addAll(group.getGavs());
        studentService.setValues(current, values);
        return "redirect:/admin/studentPage/" + current;
    }

    @RequestMapping(value = "/studentPage/{student}/formTable", method = RequestMethod.POST)
    public String formStudentTable(ModelMap modelMap,
                                   @ModelAttribute("groupedValues") GroupedValues groupedValues,
                                   @PathVariable("student") String current) {
        ArrayList<GAVPresentation> values = new ArrayList<GAVPresentation>();
        for (Group group : groupedValues.getValuesArray())
            values.addAll(group.getGavs());
        tableData = studentService.getStudentValuesInTable(values, current);
        modelMap.addAttribute("tableData", tableData);

        return "adminTable";
    }

    @RequestMapping(value = "/showDisabled", method = RequestMethod.GET)
    public String showDisabled(ModelMap modelMap) {
        List<Student> listDisabled = studentService.getAllDisabledStudents();
        tableData = new ArrayList<List<String>>();
        tableData.add(new ArrayList<String>());
        tableData.get(0).add("Name");
        tableData.get(0).add("Login");
        tableData.get(0).add("Phone");
        tableData.get(0).add("Skype");
        tableData.get(0).add("Email");
        int i = 1;
        for (Student student : listDisabled) {
            tableData.add(new ArrayList<String>());
            tableData.get(i).add(student.getFirstName() + " " + student.getSecondName());
            tableData.get(i).add(student.getLogin());
            tableData.get(i).add(student.getTelephone());
            tableData.get(i).add(student.getSkype());
            tableData.get(i++).add(student.getEmail());
        }
        modelMap.addAttribute("tableData", tableData);
        modelMap.addAttribute("enable", "disable");
        return "adminTable";
    }


    @RequestMapping(value = "/showStudying", method = RequestMethod.GET)
    public String showStudying(ModelMap modelMap) {
        List<GAVPresentation> values = new ArrayList<GAVPresentation>();
        GAVPresentation e = new GAVPresentation();
        e.setGroup("service");
        e.setValue("STUDYING");
        e.setAttribute("status");
        e.setShow(false);

        values.add(e);
        tableData = studentService.find(values);
        tableData.get(0).add("Phone");
        tableData.get(0).add("Skype");
        tableData.get(0).add("Email");

        User user;

        for(List<String> item:tableData){
            user = userService.getByLogin(item.get(1));
            if(user != null) {
                item.add(user.getTelephone());
                item.add(user.getSkype());
                item.add(user.getEmail());
            }
        }

        modelMap.addAttribute("tableData", tableData);
        modelMap.addAttribute("enable", "enable");
        return "adminTable";
    }

    @RequestMapping(value = "/showWorking", method = RequestMethod.GET)
    public String showWorking(ModelMap modelMap) {
        List<GAVPresentation> values = new ArrayList<GAVPresentation>();
        GAVPresentation e = new GAVPresentation();
        e.setGroup("service");
        e.setValue("WORKING");
        e.setAttribute("status");
        e.setShow(false);

        values.add(e);
        tableData = studentService.find(values);
        tableData.get(0).add("Phone");
        tableData.get(0).add("Skype");
        tableData.get(0).add("Email");

        User user;

        for(List<String> item:tableData){
            user = userService.getByLogin(item.get(1));
            if(user != null) {
                item.add(user.getTelephone());
                item.add(user.getSkype());
                item.add(user.getEmail());
            }
        }

        modelMap.addAttribute("tableData", tableData);
        modelMap.addAttribute("enable", "enable");
        return "adminTable";
    }

    @RequestMapping(value = "/showEnabled", method = RequestMethod.GET)
    public String showEnabled(ModelMap modelMap) {
        List<Student> listEnabled = studentService.getAllEnabledStudents();
        tableData = new ArrayList<List<String>>();
        tableData.add(new ArrayList<String>());
        tableData.get(0).add("Name");
        tableData.get(0).add("Login");
        tableData.get(0).add("Phone");
        tableData.get(0).add("Skype");
        tableData.get(0).add("Email");
        int i = 1;
        for (Student student : listEnabled) {
            tableData.add(new ArrayList<String>());
            tableData.get(i).add(student.getFirstName() + " " + student.getSecondName());
            tableData.get(i).add(student.getLogin());
            tableData.get(i).add(student.getTelephone());
            tableData.get(i).add(student.getSkype());
            tableData.get(i++).add(student.getEmail());
        }
        modelMap.addAttribute("tableData", tableData);
        modelMap.addAttribute("enable", "enable");
        return "adminTable";
    }


    @RequestMapping("/createNotif")
    public String createNotif(ModelMap modelMap) {
        CreateNotifUnit createNotifUnit = new CreateNotifUnit();
        modelMap.addAttribute("createNotifUnit", createNotifUnit);
        modelMap.addAttribute("students", studentService.getAllEnabledStudents());
        modelMap.addAttribute("feedbackers", feedbackerService.getAllFeedbackers());
        modelMap.addAttribute("workers", hrWorkerService.getAllHRWorkers());
        return "createNotification";
    }

    @RequestMapping("/sendNotif")
    public String sendNotif(@ModelAttribute("createNotifUnit") CreateNotifUnit createNotifUnit) {
        MailService mailService = new MailService("exadelt@gmail.com", "petuhanWasya", "exadelt@gmail.com");
        String title = createNotifUnit.getTitle();
        String text = createNotifUnit.getText();
        String current = UserService.getCurrentUserLogin();
        if (createNotifUnit.isForStudents()) {
            for (Student student : studentService.getAllEnabledStudents()) {
                notificationService.add(current, student.getLogin(), title, text);
                mailService.send(title, text, userService.getByLogin(student.getLogin()).getEmail());
            }
        } else {
            if (createNotifUnit.getStudents() != null)
                for (String student : createNotifUnit.getStudents()) {
                    notificationService.add(current, student, title, text);
                    mailService.send(title, text, userService.getByLogin(student).getEmail());
                }
        }
        if (createNotifUnit.isForFeedbackers()) {
            for (Feedbacker feed : feedbackerService.getAllFeedbackers()) {
                notificationService.add(current, feed.getLogin(), title, text);
                mailService.send(title, text, userService.getByLogin(feed.getLogin()).getEmail());
            }
        } else {
            if (createNotifUnit.getFeedbackers() != null)
                for (String feed : createNotifUnit.getFeedbackers()) {
                    notificationService.add(current, feed, title, text);
                    mailService.send(title, text, userService.getByLogin(feed).getEmail());
                }
        }
        /*if (createNotifUnit.isForWorkers()){
            for (HRWorker worker : HRWorkerService.getAll) {
                notificationService.add(current, worker, title, text);
                mailService.send(title, text, userService.getByLogin(worker).getEmail());
            }
        }
        else {
            for (String worker : createNotifUnit.getWorkers()) {
                notificationService.add(current, worker, title, text);
                mailService.send(title, text, userService.getByLogin(worker).getEmail());
            }
        }*/
        return "redirect:/admin";
    }

    @RequestMapping("studentPage/{student}/notif")
    public String studentNotif(@PathVariable("student") String student, ModelMap modelMap) {
        List<Notification> notifications = userService.getAllNotifications(student);
        modelMap.addAttribute("notifs", notifications);
        return "notificationList";
    }

    @RequestMapping("/showAddField/{isField}")
    public String showAddField(ModelMap modelMap, @PathVariable("isField")boolean isField) {
        modelMap.addAttribute("addFieldUnit", new AddFieldUnit());
        modelMap.addAttribute("groups", groupService.getAllGroups());
        modelMap.addAttribute("isField", isField);
        return "addField";
    }

    @RequestMapping(value = "/addField", method = RequestMethod.POST)
    public String addField(@ModelAttribute("addFieldUnit") AddFieldUnit addFieldUnit, ModelMap modelMap) {
        if (addFieldUnit.isExistingGroup()) {
            attributeService.addAttribute(addFieldUnit.getGroupNameExist(), addFieldUnit.getFieldName(), addFieldUnit.getType(), addFieldUnit.getPossibleValues());
        } else {
            groupService.addGroup(addFieldUnit.getGroupNameNew(), addFieldUnit.getForStatus());
            attributeService.addAttribute(addFieldUnit.getGroupNameNew(), addFieldUnit.getFieldName(), addFieldUnit.getType(), addFieldUnit.getPossibleValues());
        }
        if (tableData == null)
            return "redirect:/admin";
        modelMap.addAttribute("tableData", tableData);
        return "adminTable";
    }

    @RequestMapping(value = "/addTechnology", method = RequestMethod.POST)
    public String addTechnology(ModelMap modelMap, @ModelAttribute("newTech") String newTech) {
        technologyService.add(newTech);
        if (tableData == null)
            return "redirect:/admin";
        modelMap.addAttribute("tableData", tableData);
        return "adminTable";
    }

    @RequestMapping("/{student}/disable")
    public String disableStudent(@PathVariable("student") Integer index, ModelMap modelMap) {
        studentService.disable(tableData.get(index).get(1));
        tableData.remove((int) index);
        modelMap.addAttribute("tableData", tableData);
        modelMap.addAttribute("enable", "enable");
        return "adminTable";
    }

    @RequestMapping("/{student}/enable")
    public String enableStudent(@PathVariable("student") Integer index, ModelMap modelMap) {
        studentService.enable(tableData.get(index).get(1));
        tableData.remove((int) index);
        modelMap.addAttribute("tableData", tableData);
        modelMap.addAttribute("enable", "disable");
        return "adminTable";
    }

    @RequestMapping("/{student}/allFeedbacks")
    public String allStudentFeedbacks(@PathVariable("student") String student, ModelMap modelMap) {
        modelMap.addAttribute("reviews", studentService.getReviews(student));
        return "studentFeedbacks";
    }

    @RequestMapping("/showFeedback/{student}/{revId}")
    public String showStudentFeedback(@PathVariable("student") String student,
                                      @PathVariable("revId") Long revId,
                                      ModelMap modelMap) {
        Review review = reviewService.getReviewById(revId);
        modelMap.addAttribute("review", review);
        if (review.getRatings() == null || review.getRatings().size() == 0)
            return "review";
        List<Technology> techs = new ArrayList<Technology>();
        techs.add(null);
        techs.addAll(technologyService.getAllTechnologies());
        modelMap.addAttribute("techologies", techs);
        return "interview";
    }
}