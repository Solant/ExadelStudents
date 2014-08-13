package com.springapp.mvc;

import com.forView.Group;
import com.forView.GroupedValues;
import com.forView.UserUnit;
import com.forView.validators.AttributeFormValidator;
import com.services.StudentService;
import com.services.UserService;
import com.services.presentation.GAVPresentation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private AttributeFormValidator attributeFormValidator;


    @RequestMapping(value = "", method = RequestMethod.GET)
    public String studentPage(ModelMap modelMap) {
        String current = UserService.getCurrentUserLogin();

        ArrayList<GAVPresentation> gav = (ArrayList<GAVPresentation>)studentService.getValues(current);
        System.out.println(gav.size());
        GroupedValues groupedValues = new GroupedValues();

        List<GAVPresentation> internal;
        ArrayList<String> groups = new ArrayList<String>();
        for(; gav.size() > 0; ){
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
        return "student";
    }

    @RequestMapping(value = "/saveChanges", method = RequestMethod.POST)
    public String saveChanges(@Valid @ModelAttribute("groupedValues") GroupedValues groupedValues, ModelMap modelMap, BindingResult result){

        String current = UserService.getCurrentUserLogin();
        attributeFormValidator.validate(groupedValues, result);
        if (result.hasErrors()) {
            ArrayList<String> groups = new ArrayList<String>();
            for(Group group : groupedValues.getValuesArray()){
                groups.add(group.getGavs().get(0).getGroup());
            }

            modelMap.addAttribute("groups", groups);
            modelMap.addAttribute("groupedValues", groupedValues);

            UserUnit currentUser = new UserUnit();
            currentUser.setLogin(current);
            currentUser.setFirstname(studentService.getFirstName(current));
            currentUser.setLastname(studentService.getSecondName(current));
            modelMap.addAttribute("currentUser", currentUser);
            return "student";
        }
        ArrayList<GAVPresentation> values = new ArrayList<GAVPresentation>();
        for(Group group : groupedValues.getValuesArray()) {
            values.addAll(group.getGavs());
            for(GAVPresentation gav : group.getGavs())
                System.out.println(gav.getAttribute() + " " + gav.getValue() + " " + gav.getValues());
        }
        studentService.setValues(current, values);
        return "redirect:/student";
    }


}