package com.springapp.mvc;


import com.View.Group;
import com.View.GroupedValues;
import com.View.LinkUnit;
import com.View.UserUnit;
import com.services.AdministratorService;
import com.services.AttributeService;
import com.services.FeedbackerService;
import com.services.StudentService;
import com.services.presentation.GAVPresentation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
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
    public String createUser(@ModelAttribute("newUser") UserUnit newUser){
        if(newUser.getRole().toString().equals("Student"))
            studentService.add(newUser.getLogin(), newUser.getPassword(), newUser.getFirstname(), newUser.getLastname(), "STUDYING");
        if(newUser.getRole().toString().equals("Feedbacker"))
            feedbackerService.add(newUser.getLogin(), newUser.getPassword(), newUser.getFirstname(), newUser.getLastname());
        if(newUser.getRole().toString().equals("Admin"))
            administratorService.add(newUser.getLogin(), newUser.getPassword(), newUser.getFirstname(), newUser.getLastname());
        return "admin";
    }


    @RequestMapping(value = "/showLinkStudent", method = RequestMethod.GET)
    public String showLinkStudent(ModelMap model){
        model.addAttribute("linkUnit", new LinkUnit());
        model.addAttribute("allStudents", studentService.getAllEnabledStudents());
       // model.addAttribute("allFeedbackers", feedbackerService.)
        return "linking";
    }

    @RequestMapping(value = "/linkStudent", method = RequestMethod.POST)
    public String linkStudentCurator(){
        return "linking";
    }

    @RequestMapping(value = "/firedStudents", method = RequestMethod.POST)
    public String firedStudents(){
        return "";
    }

    @RequestMapping(value = "/formTable", method = RequestMethod.POST)
    public String formTable(ModelMap modelMap, @ModelAttribute("groupedValues")GroupedValues groupedValues){
        ArrayList<GAVPresentation> values = new ArrayList<GAVPresentation>();
        for(Group group:groupedValues.getValuesArray())
            values.addAll(group.getGavs());
        return "/adminTable";
    }

}