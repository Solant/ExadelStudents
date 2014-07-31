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
import java.util.Set;

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
        Set<Student> students = feedbackerService.getSupervisedStudents(current);
        List<FeedbackingUnit> studentsNames = new ArrayList<FeedbackingUnit>();
        for(Student student:students){
            FeedbackingUnit unit = new FeedbackingUnit();
            unit.setStudentName(student.getFirstName()+" "+ student.getSecondName());
            unit.setStudentLogin(student.getLogin());
            Review lastReview = studentService.getLastReview(student.getLogin());
            if(lastReview != null) {
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
    public String interview(ModelMap model, @PathVariable("current")String current){
        Set<Student> students = feedbackerService.getInterviewedStudents(current);
        List<FeedbackingUnit> studentsNames = new ArrayList<FeedbackingUnit>();
        for(Student student:students){
            FeedbackingUnit unit = new FeedbackingUnit();
            unit.setStudentName(student.getFirstName()+" "+ student.getSecondName());
            unit.setStudentLogin(student.getLogin());
            Review lastReview = studentService.getLastReview(student.getLogin());
            if(lastReview != null) {
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
        model.addAttribute("feedbackerRole", "asInterviewer");
        return "fblist";
    }

    @RequestMapping(value = "/showFeedback/{studentLogin}/{feedbackerRole}", method = RequestMethod.GET)
    public String showCuratorFeedback(@PathVariable("studentLogin")String studentLogin, ModelMap model,
                                      @PathVariable("feedbackerRole")String feedbackerRole){
        Review review = new Review();
        Student student = studentService.getStudentByLogin(studentLogin);
        review.setStudent(student);
        review.setSuitability(true);
        if(feedbackerRole.equals("asCurator")) {
            review.setFromInterview(false);
        }
        else{
            review.setFromInterview(true);
        }
        model.addAttribute("review", review);
        return "review";
    }

    @RequestMapping(value = "/addFeedback", method = RequestMethod.POST)
    public String addCuratorFeedback(@ModelAttribute("review")Review review){
        studentService.addReview(review.getStudent().getLogin(), UserService.getCurrentUserLogin(), review);
        return "redirect:/curator/"+UserService.getCurrentUserLogin();
    }


}
