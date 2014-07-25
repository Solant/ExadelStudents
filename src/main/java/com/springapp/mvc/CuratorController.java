package com.springapp.mvc;

/**
 * Created by Надя on 16.07.2014.
 */


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/curator")
public class CuratorController {
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String curatorPage(ModelMap model) {
        return "fblist";
    }

    @RequestMapping(value = "/myStudents", method = RequestMethod.GET)
    public String myStudents(){
        return "fblist";
    }

    @RequestMapping(value = "/allStudents", method = RequestMethod.GET)
    public String allStudents(){
        return "fblist";
    }

    @RequestMapping(value = "/interview", method = RequestMethod.GET)
    public String interview(){
        return "fblist";
    }

    @RequestMapping(value = "/addCuratorFeedback", method = RequestMethod.POST)
    public String addCuratorFeedback(){
        return "review";
    }

    @RequestMapping(value = "/addInterwiewerFeedback", method = RequestMethod.POST)
    public String addInterwiewerFeedback(){
        return "/adminTable.jsp";
    }
}
