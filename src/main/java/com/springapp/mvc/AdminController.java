package com.springapp.mvc;


import com.forView.*;
import com.forView.Group;
import com.forView.validators.AccountFormValidator;
import com.forView.validators.AttributeFormValidator;
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
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import persistance.model.*;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

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
    private AttributeFormValidator attributeFormValidator;

    @Autowired
    private ReviewService reviewService;

    private List<List<String>> tableData;
    private String enable;

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

    @RequestMapping(value = "/showAddUser", method = RequestMethod.GET)
    public String showAddUser(ModelMap model) {
        model.addAttribute("newUser", new UserUnit());
        model.addAttribute("isField", "user");
        return "create";
    }

    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public String addUser(ModelMap modelMap, @Valid @ModelAttribute("newUser") UserUnit newUser, BindingResult result) {
        userFormValidator.validate(newUser, result);
        if (result.hasErrors())
            return "create";
        else {
            if (newUser.getRole().toString().equals("Student"))
                studentService.add(newUser.getLogin(), newUser.getPassword(), newUser.getFirstname(), newUser.getLastname(), "STUDYING");
            if (newUser.getRole().toString().equals("Feedbacker"))
                feedbackerService.add(newUser.getLogin(), newUser.getPassword(), newUser.getFirstname(), newUser.getLastname());
            if (newUser.getRole().toString().equals("HRWorker"))
                hrWorkerService.add(newUser.getLogin(), newUser.getPassword(), newUser.getFirstname(), newUser.getLastname());
            if (newUser.getRole().toString().equals("Admin"))
                administratorService.add(newUser.getLogin(), newUser.getPassword(), newUser.getFirstname(), newUser.getLastname());
            return "redirect:/admin/showAddUser";
        }
    }


    @RequestMapping(value = "/showLinkStudent", method = RequestMethod.GET)
    public String showLinkStudent(ModelMap modelMap) {
        LinkUnit linkUnit = new LinkUnit();
        linkUnit.setCurator(true);

        modelMap.addAttribute("linkUnit", linkUnit);
        modelMap.addAttribute("students", studentService.getAllEnabledStudents());
        modelMap.addAttribute("feedbackers", feedbackerService.getAllFeedbackers());
        modelMap.addAttribute("technologies", technologyService.getAllTechnologies());
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
        return "redirect:/admin/showLinkStudent";
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
        enable = "enable";
        modelMap.addAttribute("enable", enable);
        return "/adminTable";
    }

    @RequestMapping("/formedTable")
    public String formedTable(ModelMap modelMap) {
        modelMap.addAttribute("tableData", tableData);
        modelMap.addAttribute("enable", enable);
        return "adminTable";
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
        SimpleDateFormat sdf = new SimpleDateFormat("dd_MM_yyyy");

        response.setHeader("Content-Disposition", "attachment;filename=table_" + sdf.format(Calendar.getInstance().getTime()) + ".doc");
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

        SimpleDateFormat sdf = new SimpleDateFormat("dd_MM_yyyy");
        response.setHeader("Content-Disposition", "attachment;filename=table_" + sdf.format(Calendar.getInstance().getTime()) + ".xls");
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

        SimpleDateFormat sdf = new SimpleDateFormat("dd_MM_yyyy");
        response.setHeader("Content-Disposition", "attachment;filename=table_" + sdf.format(Calendar.getInstance().getTime()) + ".pdf");
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

    @RequestMapping("/studentPage/{student}/account")
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

    @RequestMapping(value = "/studentPage/{student}/changeCommon", method = RequestMethod.POST)
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
        if (!studentService.getStatus(student).equals(status)) {
            CreateNotifUnit createNotifUnit = new CreateNotifUnit();
            createNotifUnit.setSender("System");
            createNotifUnit.setTitle("Your status was changed");
            createNotifUnit.setText(studentService.getFirstName(student) + ", your status in Exadel was changed from '"
                    + studentService.getStatus(student) + "' to '" + status + "'.");
            List<String> students = new ArrayList<String>();
            students.add(student);
            createNotifUnit.setStudents(students);
            sendNotif(createNotifUnit);
            studentService.setStatus(student, status);
        }
        if (accountUnit.getNewPassword() != null && !accountUnit.getNewPassword().equals(""))
            user.setPassword(UserService.stringToSha256(accountUnit.getNewPassword()));
        userService.update(user);
        accountUnit.setLogin(student);
        modelMap.addAttribute("accountUnit", accountUnit);
        modelMap.addAttribute("status", status);
        return "redirect:/admin/studentPage/" + student;
    }

    @RequestMapping(value = "/studentPage/{student}/saveChanges", method = RequestMethod.POST)
    public String saveChanges(@Valid @ModelAttribute("groupedValues") GroupedValues groupedValues,
                              @PathVariable("student") String current,
                              ModelMap modelMap,
                              BindingResult result) {
        attributeFormValidator.validate(groupedValues, result);
        if (result.hasErrors()) {
            ArrayList<String> groups = new ArrayList<String>();
            for (Group group : groupedValues.getValuesArray()) {
                groups.add(group.getGavs().get(0).getGroup());
            }

            modelMap.addAttribute("groups", groups);
            modelMap.addAttribute("groupedValues", groupedValues);

            UserUnit currentUser = new UserUnit();
            currentUser.setLogin(current);
            currentUser.setFirstname(studentService.getFirstName(current));
            currentUser.setLastname(studentService.getSecondName(current));
            modelMap.addAttribute("currentUser", currentUser);
            return "studentForAdmin";
        }
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
        tableData.get(0).add("Reason why disabled");
        int i = 1;
        for (Student student : listDisabled) {
            tableData.add(new ArrayList<String>());
            tableData.get(i).add(student.getFirstName() + " " + student.getSecondName());
            tableData.get(i).add(student.getLogin());
            tableData.get(i).add(student.getTelephone());
            tableData.get(i).add(student.getSkype());
            tableData.get(i).add(student.getEmail());
            tableData.get(i++).add(studentService.getValue(student.getLogin(), "reasonWhyDeleted"));
        }
        modelMap.addAttribute("tableData", tableData);
        enable = "disable";
        modelMap.addAttribute("enable", enable);
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

        for (List<String> item : tableData) {
            user = userService.getByLogin(item.get(1));
            if (user != null) {
                item.add(user.getTelephone());
                item.add(user.getSkype());
                item.add(user.getEmail());
            }
        }

        modelMap.addAttribute("tableData", tableData);
        enable = "enable";
        modelMap.addAttribute("enable", enable);
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

        for (List<String> item : tableData) {
            user = userService.getByLogin(item.get(1));
            if (user != null) {
                item.add(user.getTelephone());
                item.add(user.getSkype());
                item.add(user.getEmail());
            }
        }

        modelMap.addAttribute("tableData", tableData);
        enable = "enable";
        modelMap.addAttribute("enable", enable);
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
        enable = "enable";
        modelMap.addAttribute("enable", enable);
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
        String title = createNotifUnit.getTitle();
        String text = createNotifUnit.getText();
        String password = createNotifUnit.getPassword();
        String current;
        if (createNotifUnit.getSender() == null)
            current = UserService.getCurrentUserLogin();
        else
            current = createNotifUnit.getSender();
        String fromEmail = userService.getByLogin(current).getEmail();
        if (createNotifUnit.isForStudents()) {
            for (Student student : studentService.getAllEnabledStudents()) {
                notificationService.add(current, student.getLogin(), title, text);
                MailService mailService = new MailService(fromEmail, password, fromEmail, title, text);
                mailService.setEmail(userService.getByLogin(student.getLogin()).getEmail());
                Thread t = new Thread(mailService);
                t.start();
            }
        } else {
            if (createNotifUnit.getStudents() != null)
                for (String student : createNotifUnit.getStudents()) {
                    notificationService.add(current, student, title, text);
                    MailService mailService = new MailService(fromEmail, password, fromEmail, title, text);
                    mailService.setEmail(userService.getByLogin(student).getEmail());
                    Thread t = new Thread(mailService);
                    t.start();
                }
        }
        if (createNotifUnit.isForFeedbackers()) {
            for (Feedbacker feed : feedbackerService.getAllFeedbackers()) {
                notificationService.add(current, feed.getLogin(), title, text);
                MailService mailService = new MailService(fromEmail, password, fromEmail, title, text);
                mailService.setEmail(userService.getByLogin(feed.getLogin()).getEmail());
                Thread t = new Thread(mailService);
                t.start();
            }
        } else {
            if (createNotifUnit.getFeedbackers() != null)
                for (String feed : createNotifUnit.getFeedbackers()) {
                    notificationService.add(current, feed, title, text);
                    MailService mailService = new MailService(fromEmail, password, fromEmail, title, text);
                    mailService.setEmail(userService.getByLogin(feed).getEmail());
                    Thread t = new Thread(mailService);
                    t.start();
                }
        }
        if (createNotifUnit.isForWorkers()) {
            for (HRWorker worker : hrWorkerService.getAllHRWorkers()) {
                notificationService.add(current, worker.getLogin(), title, text);
                MailService mailService = new MailService(fromEmail, password, fromEmail, title, text);
                mailService.setEmail(userService.getByLogin(worker.getLogin()).getEmail());
                Thread t = new Thread(mailService);
                t.start();
            }
        } else {

            if (createNotifUnit.getFeedbackers() != null) {
                for (String worker : createNotifUnit.getWorkers()) {
                    notificationService.add(current, worker, title, text);
                    MailService mailService = new MailService(fromEmail, password, fromEmail, title, text);
                    mailService.setEmail(userService.getByLogin(worker).getEmail());
                    Thread t = new Thread(mailService);
                    t.start();
                }
            }
        }
        return "redirect:/admin/createNotif";
    }

    @RequestMapping("studentPage/{student}/notif")
    public String studentNotif(@PathVariable("student") String student, ModelMap modelMap) {
        List<Notification> notifications = userService.getAllNotifications(student);
        modelMap.addAttribute("notifs", notifications);
        modelMap.addAttribute("name", studentService.getFirstName(student) + " " + studentService.getSecondName(student));
        return "notificationList";
    }

    @RequestMapping("/showAddField/{isField}")
    public String showAddField(ModelMap modelMap, @PathVariable("isField") boolean isField) {
        AddFieldUnit addFieldUnit = new AddFieldUnit();
        addFieldUnit.setExistingGroup(true);
        modelMap.addAttribute("addFieldUnit", addFieldUnit);
        modelMap.addAttribute("groups", groupService.getAllGroups());
        modelMap.addAttribute("isField", isField);
        return "addField";
    }

    @RequestMapping(value = "/addField", method = RequestMethod.POST)
    public String addField(@ModelAttribute("addFieldUnit") AddFieldUnit addFieldUnit, ModelMap modelMap) {
        String groupName;
        CreateNotifUnit createNotifUnit = new CreateNotifUnit();
        if (addFieldUnit.isExistingGroup()) {
            groupName = addFieldUnit.getGroupNameExist();
            addFieldUnit.setForStatus(groupService.getGroupByName(groupName).getStatus());
        } else {
            groupService.addGroup(addFieldUnit.getGroupNameNew(), addFieldUnit.getForStatus());
            groupName = addFieldUnit.getGroupNameNew();
        }

        String pattern = null;
        String errorMessage = null;

        if (addFieldUnit.getValueType() != null) {
            if (addFieldUnit.getValueType().equals("number")) {
                pattern = "^[0-9]*$";
                errorMessage = "\"" + addFieldUnit.getFieldName() + "\" must contain a number";
            }

            if (addFieldUnit.getValueType().equals("fullName")) {
                pattern = "^[A-Za-z//s//-//.]*$";
                errorMessage = "\"" + addFieldUnit.getFieldName() + "\" must contain a full name";
            }

            if (addFieldUnit.getValueType().equals("symbolsOnly")) {
                pattern = "^[A-Za-z//s]*$";
                errorMessage = "\"" + addFieldUnit.getFieldName() + "\" must contain only latin symbols and space";
            }
        }
        attributeService.addAttribute(groupName, addFieldUnit.getFieldName(), addFieldUnit.getType(), addFieldUnit.getPossibleValues(), pattern, errorMessage);

        String subject = "Group: " + groupName + "\nField name: " + addFieldUnit.getFieldName() + "\nPlease, fill it.";
        createNotifUnit.setText(subject);
        createNotifUnit.setTitle("A new field was added");
        createNotifUnit.setStudents(new ArrayList<String>());
        createNotifUnit.setSender("System");
        if (addFieldUnit.getForStatus().equals("WORKING")) {
            List<GAVPresentation> values = new ArrayList<GAVPresentation>();
            GAVPresentation e = new GAVPresentation();
            e.setValue("WORKING");
            e.setAttribute("status");
            values.add(e);
            List<List<String>> students = studentService.find(values);
            for (List<String> student : students) {
                if (!student.get(1).equals("Login"))
                    createNotifUnit.getStudents().add(student.get(1));
            }
        }
        if (addFieldUnit.getForStatus().equals("STUDYING")) {
            List<GAVPresentation> values = new ArrayList<GAVPresentation>();
            GAVPresentation e = new GAVPresentation();
            e.setValue("STUDYING");
            e.setAttribute("status");
            values.add(e);
            List<List<String>> students = studentService.find(values);
            for (List<String> student : students) {
                if (!student.get(1).equals("Login"))
                    createNotifUnit.getStudents().add(student.get(1));
            }
        }
        if (addFieldUnit.getForStatus().equals("for_everybody")) {
            createNotifUnit.setForStudents(true);
        }
        sendNotif(createNotifUnit);
        return "redirect:/admin/showAddField/true";
    }

    @RequestMapping(value = "/addTechnology", method = RequestMethod.POST)
    public String addTechnology(ModelMap modelMap, @ModelAttribute("newTech") String newTech) {
        technologyService.add(newTech);
        return "redirect:/admin/showAddField/false";
    }

    @RequestMapping("/disable")
    public String disableStudent(@ModelAttribute("reason") String reason, @ModelAttribute("studentNumber") int index, ModelMap modelMap) {
        List <GAVPresentation> forReason = new ArrayList<GAVPresentation>();
        GAVPresentation reasonGAV = new GAVPresentation();
        reasonGAV.setAttribute("reasonWhyDeleted");
        reasonGAV.setValue(reason);
        forReason.add(reasonGAV);
        studentService.setValues(tableData.get(index).get(1), forReason);
        studentService.disable(tableData.get(index).get(1));
        tableData.remove((int) index);
        return "redirect:/admin/formedTable";
    }

    @RequestMapping("/{student}/enable")
    public String enableStudent(@PathVariable("student") Integer index, ModelMap modelMap) {
        studentService.enable(tableData.get(index).get(1));
        tableData.remove((int) index);
        return "redirect:/admin/formedTable";
    }

    @RequestMapping("/studentPage/{student}/allFeedbacks")
    public String allStudentFeedbacks(@PathVariable("student") String student, ModelMap modelMap) {
        modelMap.addAttribute("reviews", studentService.getReviews(student));
        modelMap.addAttribute("studentName", studentService.getFirstName(student) + " " + studentService.getSecondName(student));
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

    @RequestMapping(value = "liveSearch", method = RequestMethod.GET)
    public
    @ResponseBody
    List<JSONStudent> liveSearch(@ModelAttribute("initials") String initials) {
        return studentService.liveSearch(initials, 5);
    }

    @RequestMapping(value = "/feedbackersForTechnology", method = RequestMethod.GET)
    public
    @ResponseBody
    List<JSONFeedbacker> feedbackersForTechnology(@ModelAttribute("technology") String technologyName) {

        return feedbackerService.filterFeedbackers(technologyName);
    }


    @RequestMapping("/showChangeField/{isField}")
    public String showChangeField(ModelMap modelMap, @PathVariable("isField") String isField) {
        AddFieldUnit addFieldUnit = new AddFieldUnit();
        addFieldUnit.setExistingGroup(true);
        modelMap.addAttribute("changeGroupUnit", new ChangeGroupUnit());
        modelMap.addAttribute("addFieldUnit", addFieldUnit);
        modelMap.addAttribute("groups", groupService.getAllGroups());
        modelMap.addAttribute("techs", technologyService.getAllTechnologies());
        AccountUnit accountUnit = new AccountUnit();
        modelMap.addAttribute("accountUnit", accountUnit);

        List<String> attributes = new ArrayList();
        for (GAVPresentation gav : attributeService.getAllAttributes()) {
            attributes.add(gav.getAttribute());
        }
        modelMap.addAttribute("attributes", attributes);
        modelMap.addAttribute("isField", isField);
        return "changeField";
    }

    @RequestMapping(value = "/changeTech", method = RequestMethod.POST)
    public String changeTech(@ModelAttribute("newTechName") String newTechName,
                             @ModelAttribute("oldTechName") String oldTechName) {
        technologyService.changeTechnology(oldTechName, newTechName);
        if (tableData == null)
            return "redirect:/admin";
        return "redirect:/admin/formedTable";
    }

    @RequestMapping(value = "/deleteField", method = RequestMethod.POST)
    public String deleteField(@ModelAttribute("addFieldUnit") AddFieldUnit addFieldUnit, ModelMap modelMap) {
        if (addFieldUnit.getOldFieldName() != null) {
            attributeService.removeAttribute(addFieldUnit.getOldFieldName());
        }

        if (tableData == null)
            return "redirect:/admin";
        return "redirect:/admin/formedTable";
    }

    @RequestMapping(value = "/changeField", method = RequestMethod.POST)
    public String changeField(@ModelAttribute("addFieldUnit") AddFieldUnit addFieldUnit, ModelMap modelMap) {

        if (addFieldUnit.getOldFieldName() != null) {

            String newFieldName = addFieldUnit.getFieldName();
            if (newFieldName == null)
                newFieldName = addFieldUnit.getOldFieldName();
            else {
                if (newFieldName.trim().equals(""))
                    newFieldName = addFieldUnit.getOldFieldName();
            }


            String groupName;
            if (addFieldUnit.isExistingGroup()) {
                groupName = addFieldUnit.getGroupNameExist();
            } else {
                groupService.addGroup(addFieldUnit.getGroupNameNew(), addFieldUnit.getForStatus());
                groupName = addFieldUnit.getGroupNameNew();
            }

            String pattern = null;
            String errorMessage = null;

            if (addFieldUnit.getValueType() != null) {
                if (addFieldUnit.getValueType().equals("number")) {
                    pattern = "^[0-9]*$";
                    errorMessage = addFieldUnit.getFieldName() + " must be a number";
                }

                if (addFieldUnit.getValueType().equals("fullName")) {
                    pattern = "^[A-Za-z//s//-//.]*$";
                    errorMessage = addFieldUnit.getFieldName() + " must be a full name";
                }

                if (addFieldUnit.getValueType().equals("symbolsOnly")) {
                    pattern = "^[A-Za-z//s]*$";
                    errorMessage = addFieldUnit.getFieldName() + " must contain only latin symbols and space";
                }
            }
            attributeService.updateAttribute(addFieldUnit.getOldFieldName(), groupName, newFieldName,
                    addFieldUnit.getType(), addFieldUnit.getPossibleValues(), pattern, errorMessage);

        }
        if (tableData == null)
            return "redirect:/admin";
        return "redirect:/admin/formedTable";
    }

    @RequestMapping(value = "/deleteGroup", method = RequestMethod.POST)
    public String deleteGroup(@ModelAttribute("changeGroupUnit") ChangeGroupUnit changeGroupUnit, ModelMap modelMap) {
        if (changeGroupUnit.getOldGroupName() != null) {
            groupService.deleteGroup(changeGroupUnit.getOldGroupName());

        }

        if (tableData == null)
            return "redirect:/admin";
        return "redirect:/admin/formedTable";

    }

    @RequestMapping(value = "/changeGroup", method = RequestMethod.POST)
    public String changeGroup(@ModelAttribute("changeGroupUnit") ChangeGroupUnit changeGroupUnit, ModelMap modelMap) {
        if (changeGroupUnit.getOldGroupName() != null) {
            String newGroupName = changeGroupUnit.getNewGroupName();
            if (newGroupName == null)
                newGroupName = changeGroupUnit.getOldGroupName();
            else {
                if (newGroupName.trim().equals(""))
                    newGroupName = changeGroupUnit.getOldGroupName();
            }

            groupService.updateGroup(changeGroupUnit.getOldGroupName(),
                    newGroupName, changeGroupUnit.getStatus());

        }

        if (tableData == null)
            return "redirect:/admin";
        return "redirect:/admin/formedTable";
    }

    @RequestMapping(value = "/showField", method = RequestMethod.GET)
    public @ResponseBody JSONField showField(@ModelAttribute("field") String fieldName) {
        return attributeService.getJSONField(fieldName);
    }


    @RequestMapping(value = "/showGroup", method = RequestMethod.GET)
    public @ResponseBody String showGroup(@ModelAttribute("group") String groupName) {
        return groupService.getGroupByName(groupName).getStatus();
    }

    @RequestMapping(value = "/changeUser", method = RequestMethod.POST)
    public String changeUser(@ModelAttribute("accountUnit") AccountUnit accountUnit, @ModelAttribute("userLogin") String login){
        if(accountUnit.getLogin()!=null){
            if(!accountUnit.getLogin().trim().equals("")){
                User user = userService.getByLogin(login);
                user.setLogin(accountUnit.getLogin());
                user.setFirstName(accountUnit.getFirstName());
                user.setSecondName(accountUnit.getSecondName());
                if(accountUnit.getPassword()!=null)
                    if(!accountUnit.getPassword().trim().equals(""))
                        user.setPassword(UserService.stringToSha256(accountUnit.getPassword()));
                userService.update(user);
            }
        }
        return "redirect:/admin/showChangeField/user";
    }

    @RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
    public String deleteUser(@ModelAttribute("userLogin") String userLogin){
        if(userLogin!=null){
            if(!userLogin.equals("")){
                userService.delete(userLogin);
            }
        }
        return "redirect:/admin/showChangeField/user";
    }


    @RequestMapping(value = "/showUsersToChange", method = RequestMethod.GET)
    public @ResponseBody List<JSONUser> showUsersToDelete(@ModelAttribute("role") String role) {
        return userService.getAllWithRole(role);
    }

    @RequestMapping(value = "/showChosenUser", method = RequestMethod.GET)
    public @ResponseBody JSONUser showChosenUser(@ModelAttribute("login") String login) {
        User user = userService.getByLogin(login);
        JSONUser jsonUser = new JSONUser();
        jsonUser.setFirstName(user.getFirstName());
        jsonUser.setSecondName(user.getSecondName());
        jsonUser.setLogin(user.getLogin());
        return jsonUser;
    }

    @RequestMapping("/showUnlink")
    public String showUnlink(ModelMap modelMap){
        modelMap.addAttribute("students", studentService.getAllEnabledStudents());
        modelMap.addAttribute("feeds", feedbackerService.getAllFeedbackers());
        modelMap.addAttribute("unlinkUnit", new UnlinkUnit());
        return "unlink";
    }

    @RequestMapping(value = "/unlink/curatorsForStudent", method = RequestMethod.GET)
    public
    @ResponseBody
    List<JSONFeedbacker> feedbackersForStudent(@ModelAttribute("student") String student) {

        return feedbackerService.getJSONCuratorsByStudent(student);
    }

    @RequestMapping(value = "/unlink/interviewersForStudent", method = RequestMethod.GET)
    public
    @ResponseBody
    List<JSONFeedbacker> interviewersForStudent(@ModelAttribute("student") String student) {

        return feedbackerService.getJSONInterviewersByStudent(student);
    }

    @RequestMapping(value = "/unlink/curatedForFeed", method = RequestMethod.GET)
    public
    @ResponseBody
    List<JSONStudent> curatedForFeed(@ModelAttribute("student") String student) {
        return feedbackerService.getJSONSupervisedStudents(student);
    }

    @RequestMapping(value = "/unlink/interviewedForFeed", method = RequestMethod.GET)
    public
    @ResponseBody
    List<JSONStudent> interviewedForFeed(@ModelAttribute("student") String student) {
        return feedbackerService.getJSONInterviewedStudents(student);
    }

    @RequestMapping(value = "/unlink", method = RequestMethod.POST)
    public String unlink(@ModelAttribute("unlinkUnit")UnlinkUnit unlinkUnit){
        if(unlinkUnit.getCurators() != null)
        for(String feed:unlinkUnit.getCurators()){
            feedbackerService.unlink(unlinkUnit.getStudent(), feed, true);
        }
        if(unlinkUnit.getInterviewers() != null)
        for(String feed:unlinkUnit.getInterviewers()){
            feedbackerService.unlink(unlinkUnit.getStudent(), feed, false);
        }
        return "redirect:/admin/showUnlink";
    }


    @RequestMapping(value = "/deleteTechnology", method = RequestMethod.POST)
    public String deleteTechnology(@ModelAttribute("oldTechName") String oldTechName, ModelMap modelMap) {
        if (oldTechName != null) {
            if(!oldTechName.equals(""))
                technologyService.remove(oldTechName);
        }

        if (tableData == null)
            return "redirect:/admin";
        return "redirect:/admin/formedTable";

    }
}
