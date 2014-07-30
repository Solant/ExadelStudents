package com.springapp.mvc;

/**
 * Created by Надя on 16.07.2014.
 */


import com.services.FeedbackerService;
import com.services.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/curator/{current}")
public class CuratorController {

    @Autowired
    private FeedbackerService feedbackerService;

    @Autowired
    private StudentService studentService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String curatorPage(@PathVariable("current")String current) {
        return "redirect:/curator/"+current+"/myStudents";
    }

    @RequestMapping(value = "/myStudents", method = RequestMethod.GET)
    public String myStudents(ModelMap model, @PathVariable("current")String current){
        List<String> studentsLogins = feedbackerService.getStudents(current);
        List<String> studentsNames = new ArrayList<String>();
        for(String student:studentsLogins){
            studentsNames.add(studentService.getFirstName(student)+" "+studentService.getSecondName(student));
        }
        model.addAttribute("studentList", studentsNames);
        model.addAttribute("feedbackerRole", "asCurator");
        return "fblist";
    }

    @RequestMapping(value = "/interview", method = RequestMethod.GET)
    public String interview(ModelMap model){
        model.addAttribute("feedbackerRole", "asInterviewer");
        return "fblist";
    }

    @RequestMapping(value = "/addFeedback/asCurator", method = RequestMethod.GET)
    public String addCuratorFeedback(){
        return "review";
    }

    @RequestMapping(value = "/addFeedback/asInterviewer", method = RequestMethod.GET)
    public String addInterwiewerFeedback(){
        return "interview";
    }
}
