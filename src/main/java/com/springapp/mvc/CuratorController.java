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
        return "feedbacker_main";
    }

    @RequestMapping(value = "/addCuratorFeedback", method = RequestMethod.POST)
    public String addCuratorFeedback(){
        return "feedbacker_main";
    }

    @RequestMapping(value = "/addInterwiewerFeedback", method = RequestMethod.POST)
    public String addInterwiewerFeedback(){
        return "feedbacker_main";
    }
}
