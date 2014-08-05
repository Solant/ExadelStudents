package com.springapp.mvc;


import com.forView.*;
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
import persistance.model.Feedbacker;
import persistance.model.Notification;
import persistance.model.Student;

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
    private NotificationService notificationService;

    @Autowired
    private GroupService groupService;

    @Autowired
    private UserFormValidator userFormValidator;

    private List<List<String>> tableData;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String workerPage(ModelMap modelMap) {
        ArrayList<GAVPresentation> gav = (ArrayList<GAVPresentation>)attributeService.getAllAttributes();
        GroupedValues groupedValues = new GroupedValues();

        List<GAVPresentation> internal;
        ArrayList<String> groups = new ArrayList<String>();
        for(int j = 0; gav.size() > 0; j++){
            internal = new ArrayList<GAVPresentation>();
            GAVPresentation temp = gav.remove(0);
            internal.add(temp);
            for(int i = 0; i < gav.size(); i++){
                if(gav.get(i).getGroup().equals(temp.getGroup())){
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
    public String returnCreate(ModelMap model){
        model.addAttribute("newUser", new UserUnit());
        return "create";
    }

    @RequestMapping(value = "/createUser", method = RequestMethod.POST)
    public String createUser( ModelMap modelMap, @Valid @ModelAttribute("newUser") UserUnit newUser,BindingResult result){
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
    public String showLinkStudent(ModelMap modelMap){
        LinkUnit linkUnit = new LinkUnit();
        modelMap.addAttribute("students", studentService.getAllEnabledStudents());
        List<String> technologies = new ArrayList<String>();
        Map<String, Set<Feedbacker>> feedbackerMap = new HashMap<String, Set<Feedbacker>>();
        technologies.add("java");
        technologies.add("js");
        for(String tech:technologies){
            feedbackerMap.put(tech, feedbackerService.getFeedbackersByTechnology(tech));
        }
        modelMap.addAttribute("feedbackerMap", feedbackerMap);
        modelMap.addAttribute("technologies", technologies);
        modelMap.addAttribute("linkUnit", linkUnit);
        return "linking";
    }

    @RequestMapping(value = "/linkStudent", method = RequestMethod.POST)
    public String linkStudentCurator(@ModelAttribute("linkUnit")LinkUnit linkUnit, ModelMap modelMap){
        if(linkUnit.isCurator()) {
            for (String student : linkUnit.getStudents()) {
                for (String feed : linkUnit.getFeedbackers()) {
                    studentService.addCurator(feed, student);
                }
            }
        }
        else {
            for (String student : linkUnit.getStudents()) {
                for (String feed : linkUnit.getFeedbackers()) {
                    studentService.addInterviewer(feed, student);
                }
            }
        }
        if(tableData == null)
            return "redirect:/admin";
        modelMap.addAttribute("tableData", tableData);
        return "adminTable";
    }


    @RequestMapping(value = "/formTable", method = RequestMethod.POST)
    public String formTable(ModelMap modelMap, @ModelAttribute("groupedValues")GroupedValues groupedValues){
        ArrayList<GAVPresentation> values = new ArrayList<GAVPresentation>();
        for(Group group:groupedValues.getValuesArray())
            values.addAll(group.getGavs());
        tableData = studentService.find(values);
        modelMap.addAttribute("tableData", tableData);
        return "/adminTable";
    }

    @RequestMapping(value = "/exportWord", method = RequestMethod.GET)
    public String exportWord(HttpServletResponse response){
        WordTableService wts = new WordTableService("Students' table");

        for (List<String> row:tableData) {
            wts.addNewRow();
            for (String item:row)
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
    public String exportExcel(HttpServletResponse response){
        ExcelTableService ets = new ExcelTableService();

        for (List<String> row:tableData) {
            ets.addNewRow();
            for (String item:row)
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
    public String exportPDF(HttpServletResponse response){

        response.setHeader("Content-Disposition", "attachment;filename=table.pdf");
        OutputStream os = null;
        try {
            os = response.getOutputStream();
        } catch (IOException e) {
            e.printStackTrace();
        }

        PDFTableService pdfts = new PDFTableService(tableData.get(0).size(), os, true);

        for (List<String> row:tableData) {
            for (String item:row)
                pdfts.addNewCell(item);
        }

        pdfts.finishWritingInStream();


        return "";
    }

    @RequestMapping("/studentPage/{student}")
    public String studentPage(@PathVariable("student")String current, ModelMap modelMap){
        ArrayList<GAVPresentation> gav = (ArrayList<GAVPresentation>)studentService.getValues(current);
        System.out.println(gav.size());
        GroupedValues groupedValues = new GroupedValues();

        List<GAVPresentation> internal;
        ArrayList<String> groups = new ArrayList<String>();
        for(int j = 0; gav.size() > 0; j++){
            internal = new ArrayList<GAVPresentation>();
            GAVPresentation temp = gav.remove(0);
            internal.add(temp);
            for(int i = 0; i < gav.size(); i++){
                if(gav.get(i).getGroup().equals(temp.getGroup())){
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

    @RequestMapping(value = "/studentPage/{student}/saveChanges", method = RequestMethod.POST)
    public String saveChanges(@ModelAttribute("groupedValues") GroupedValues groupedValues,
                              @PathVariable("student") String current,
                              ModelMap modelMap){
        ArrayList<GAVPresentation> values = new ArrayList<GAVPresentation>();
        for(Group group:groupedValues.getValuesArray())
            values.addAll(group.getGavs());
        studentService.setValues(current, values);
        return "redirect:/admin/studentPage/"+current;
    }

    @RequestMapping(value = "/studentPage/{student}/formTable", method = RequestMethod.POST)
    public String formStudentTable(ModelMap modelMap,
                                   @ModelAttribute("groupedValues")GroupedValues groupedValues,
                                   @PathVariable("student")String current){
        ArrayList<GAVPresentation> values = new ArrayList<GAVPresentation>();
        for(Group group:groupedValues.getValuesArray())
            values.addAll(group.getGavs());
        tableData = studentService.getStudentValuesInTable(values, current);
        modelMap.addAttribute("tableData", tableData);

        return "adminTable";
    }
    @RequestMapping(value = "/showDisabled", method = RequestMethod.GET)
    public String showDisabled(ModelMap modelMap){
        List<Student> listDisabled = studentService.getAllDisabledStudents();
        tableData = new ArrayList<List<String>>();
        tableData.add(new ArrayList<String>());
        tableData.get(0).add("Name");
        tableData.get(0).add("Login");
        tableData.get(0).add("Phone");
        tableData.get(0).add("Skype");
        tableData.get(0).add("Email");
        int i = 1;
        for(Student student:listDisabled){
            tableData.add(new ArrayList<String>());
            tableData.get(i).add(student.getFirstName()+" "+student.getSecondName());
            tableData.get(i).add(student.getLogin());
            tableData.get(i).add(student.getTelephone());
            tableData.get(i).add(student.getSkype());
            tableData.get(i++).add(student.getEmail());
        }
        modelMap.addAttribute("tableData", tableData);
        return "adminTable";
    }

    @RequestMapping("/createNotif")
    public String createNotif(ModelMap modelMap){
        CreateNotifUnit createNotifUnit = new CreateNotifUnit();
        modelMap.addAttribute("createNotifUnit", createNotifUnit);
        modelMap.addAttribute("students", studentService.getAllEnabledStudents());
        modelMap.addAttribute("feedbackers", feedbackerService.getAllFeedbackers());
        modelMap.addAttribute("workers", hrWorkerService.getAllHRWorkers());
        return "createNotification";
    }

    @RequestMapping("/sendNotif")
    public String sendNotif(@ModelAttribute("createNotifUnit")CreateNotifUnit createNotifUnit){
        MailService mailService = new MailService("exadelt@gmail.com", "petuhanWasya", "exadelt@gmail.com");
        String title = createNotifUnit.getTitle();
        String text = createNotifUnit.getText();
        String current = UserService.getCurrentUserLogin();
        if(createNotifUnit.isForStudents())
            for(String student:createNotifUnit.getStudents()){
                notificationService.add(current, student,title, text);
                mailService.send(title, text, userService.getByLogin(student).getEmail());
            }
        if(createNotifUnit.isForFeedbackers())
            for(String feed:createNotifUnit.getFeedbackers()){
                notificationService.add(current, feed,title, text);
                mailService.send(title, text, userService.getByLogin(feed).getEmail());
            }
        if(createNotifUnit.isForWorkers())
            for(String worker:createNotifUnit.getWorkers()){
                notificationService.add(current, worker,title, text);
                mailService.send(title, text, userService.getByLogin(worker).getEmail());
            }
        return "redirect:/admin";
    }

    @RequestMapping("studentPage/{student}/notif")
    public String studentNotif(@PathVariable("student")String student, ModelMap modelMap){
        List<Notification> notifications = userService.getAllNotifications(student);
        modelMap.addAttribute("notifs", notifications);
        return "notificationList";
    }

    @RequestMapping("/showAddField")
    public String showAddField(ModelMap modelMap){
        modelMap.addAttribute("addFieldUnit", new AddFieldUnit());
        modelMap.addAttribute("groups",groupService.getAllGroups() );
        return "addField";
    }

    @RequestMapping(value = "/addField", method = RequestMethod.POST)
    public String addField(@ModelAttribute("addFieldUnit")AddFieldUnit addFieldUnit, ModelMap modelMap){
        if(addFieldUnit.isExistingGroup()){
            attributeService.addAttribute(addFieldUnit.getGroupNameExist(), addFieldUnit.getFieldName(), addFieldUnit.getType(), addFieldUnit.getPossibleValues());
        }
        else{
            groupService.addGroup(addFieldUnit.getGroupNameNew(), addFieldUnit.getForStatus());
            attributeService.addAttribute(addFieldUnit.getGroupNameNew(), addFieldUnit.getFieldName(), addFieldUnit.getType(), addFieldUnit.getPossibleValues());
        }
        if(tableData == null)
            return "redirect:/admin";
        modelMap.addAttribute("tableData", tableData);
        return "adminTable";
    }
}