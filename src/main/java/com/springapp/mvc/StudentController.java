package com.springapp.mvc;

import com.services.StudentService;
import com.services.UserService;
import com.services.presentation.GAVPresentation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String studentPage(ModelMap modelMap) {
        ArrayList<GAVPresentation> gav = studentService.getValues(userService.getCurrentUserLogin());

        ArrayList<ArrayList<GAVPresentation>> groupedValues = new ArrayList<ArrayList<GAVPresentation>>();
        ArrayList<String> groups = new ArrayList<String>();
        while(gav.size() > 0){
            ArrayList<GAVPresentation> internal = new ArrayList<GAVPresentation>();
            GAVPresentation temp = gav.remove(0);
            internal.add(temp);
            for(int i = 0; i < gav.size(); i++){
                if(gav.get(i).getGroup().equals(temp.getGroup())){
                    internal.add(gav.get(i));
                    gav.remove(gav.get(i++));
                }
            }
            groups.add(temp.getGroup());
            groupedValues.add(internal);
        }
        modelMap.addAttribute("groups", groups);
        modelMap.addAttribute("groupedValues", groupedValues);
        return "student";
    }

    @RequestMapping(value = "/saveChanges", method = RequestMethod.POST)
    public String saveChanges(){
        return "student";
    }
}