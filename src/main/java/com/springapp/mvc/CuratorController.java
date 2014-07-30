package com.springapp.mvc;

/**
 * Created by Надя on 16.07.2014.
 */


import com.View.FeedbackingUnit;
import com.services.FeedbackerService;
import com.services.StudentService;
import com.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import persistance.model.Review;
import persistance.model.Student;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/curator/{current}")
public class CuratorController {

    @Autowired
    private FeedbackerService feedbackerService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String curatorPage(@PathVariable("current")String current) {
        return "redirect:/curator/"+current+"/myStudents";
    }

    @RequestMapping(value = "/myStudents", method = RequestMethod.GET)
    public String myStudents(ModelMap model, @PathVariable("current")String current){
        List<String> studentsLogins = feedbackerService.getStudents(current);
        List<FeedbackingUnit> studentsNames = new ArrayList<FeedbackingUnit>();
        for(String student:studentsLogins){
            FeedbackingUnit unit = new FeedbackingUnit();
            unit.setStudentName(studentService.getFirstName(student)+" "+ studentService.getSecondName(student));
            unit.setStudentLogin(student);
            List<Review> reviews = studentService.getReviews(student);
            Review lastReview;
            if(reviews.size()>0) {
                lastReview = reviews.get(reviews.size() - 1);
                unit.setFeedbackerName(lastReview.getFeedbacker().getFirstName() + " " + lastReview.getFeedbacker().getSecondName());
                unit.setDate(lastReview.getDate().getTime());
            }
            else{
                unit.setFeedbackerName("There is no feedbacks to this student");
                unit.setDate(null);
            }
            studentsNames.add(unit);
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

    @RequestMapping(value = "/showFeedback/{studentLogin}/asCurator", method = RequestMethod.GET)
    public String showCuratorFeedback(@PathVariable("studentLogin")String studentLogin, ModelMap model){
        Review review = new Review();
        Student student = studentService.getStudentByLogin(studentLogin);
        review.setStudent(student);
        review.setSuitability(true);
        review.setFromInterview(false);
        model.addAttribute("feedbackerRole", "asCurator");
        model.addAttribute("review", review);
        return "review";
    }

    @RequestMapping(value = "/addFeedback/asCurator", method = RequestMethod.POST)
    public String addCuratorFeedback(@ModelAttribute("review")Review review){
        studentService.addReview(review.getStudent().getLogin(), UserService.getCurrentUserLogin(), review);
        return "redirect:/curator/"+UserService.getCurrentUserLogin();
    }

    @RequestMapping(value = "/addFeedback/{studentLogin}/asInterviewer", method = RequestMethod.GET)
    public String addInterwiewerFeedback(){
        return "interview";
    }
}
