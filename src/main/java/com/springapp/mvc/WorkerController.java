package com.springapp.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Надя on 16.07.2014.
 */
@Controller
@RequestMapping("/worker")
public class WorkerController {
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String workerPage(ModelMap model) {
        return "select_fields";
    }
    @RequestMapping(value = "/createUser", method = RequestMethod.GET)
    public String createUser(){
        return "create";
    }

    @RequestMapping(value = "/changeStudent", method = RequestMethod.POST)
    public String changeStudent(){
        return "";
    }

    @RequestMapping(value = "/changeCurator", method = RequestMethod.POST)
    public String changeCurator(){
        return "";
    }

    @RequestMapping(value = "/changeWorker", method = RequestMethod.POST)
    public String changeWorker(){
        return "";
    }

    @RequestMapping(value = "/linkStudentCurator", method = RequestMethod.POST)
    public String linkStudentCurator(){
        return "";
    }

    @RequestMapping(value = "/linkStudentInterwiewer", method = RequestMethod.POST)
    public String linkStudentInterwiewer(){
        return "";
    }

    @RequestMapping(value = "/firedStudents", method = RequestMethod.POST)
    public String firedStudents(){
        return "";
    }

    @RequestMapping(value = "/formTable", method = RequestMethod.POST)
    public String formTable(){
        return "feedbacker_main";
    }

}