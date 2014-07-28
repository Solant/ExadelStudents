package com.springapp.mvc;

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
        ArrayList<String> groups = new ArrayList<String>();
        for(int i = 0; gav.size() > 0; i++) {
            GAVPresentation temp = gav.remove(0);
            groupedValues.getValuesArray()[i][0] = temp;
            for (int j = 1; j < gav.size(); j++) {
                if (gav.get(j).getGroup().equals(temp.getGroup())) {
                    groupedValues.getValuesArray()[i][j] = gav.get(j);
                    gav.remove(gav.get(j++));
                }
            }
            groups.add(temp.getGroup());
        }
        modelMap.addAttribute("groups", groups);
        modelMap.addAttribute("groupedValues", groupedValues);

       /* ArrayList<String> groups = new ArrayList<String>();
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
            groupedValues.getValuesArray().add(internal);
        }
        modelMap.addAttribute("groups", groups);
        modelMap.addAttribute("groupedValues", groupedValues);
        GAVPresentation g = new GAVPresentation();
        g.setValue("some");
        modelMap.addAttribute("test", g);*/
        return "student";
    }

    @RequestMapping(value = "/saveChanges", method = RequestMethod.POST)
    public String saveChanges(@ModelAttribute("groupedValues") GroupedValues groupedValues, @PathVariable("current") String current){
        //System.out.print(groupedValues.getValuesArray().size());
        ArrayList<GAVPresentation> values = new ArrayList<GAVPresentation>();
        for(GAVPresentation[] item:groupedValues.getValuesArray())
            for(GAVPresentation item2 : item)
                values.add(item2);
        System.out.print( "1" + values.get(0).getAttribute());
        studentService.setValues(current, values);
        return "redirect:/  student/"+current;
    }
}