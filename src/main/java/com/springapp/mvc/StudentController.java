package com.springapp.mvc;

import com.View.Group;
import com.View.GroupedValues;
import com.services.StudentService;
import com.services.UserService;
import com.services.presentation.GAVPresentation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/student/{current}")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String studentPage(ModelMap modelMap, @PathVariable("current") String current) {
        ArrayList<GAVPresentation> gav = studentService.getValues(current);

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
                    gav.remove(i++);
                }
            }
            groups.add(temp.getGroup());
            Group internalGroup = new Group();
            internalGroup.setGroup(internal);
            groupedValues.getValuesArray().add(internalGroup);
        }
        modelMap.addAttribute("groups", groups);
        modelMap.addAttribute("groupedValues", groupedValues);
        return "student";
    }

    @RequestMapping(value = "/saveChanges", method = RequestMethod.POST)
    public String saveChanges(@ModelAttribute("groupedValues") GroupedValues groupedValues, @PathVariable("current") String current){
        ArrayList<GAVPresentation> values = new ArrayList<GAVPresentation>();
        for(Group group:groupedValues.getValuesArray())
            values.addAll(group.getGroup());
        studentService.setValues(current, values);
        return "redirect:/student/"+current;
    }
}