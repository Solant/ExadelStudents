package com.springapp.mvc;

/**
 * Created by Надя on 16.07.2014.
 */


import com.forView.FeedbackingUnit;
import com.services.FeedbackerService;
import com.services.StudentService;
import com.services.TechnologyService;
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
import persistance.model.Technology;

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

    @Autowired
    private TechnologyService technologyService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String curatorPage(@PathVariable("current") String current) {
        return "redirect:/curator/" + current + "/myStudents";
    }

    @RequestMapping(value = "/myStudents", method = RequestMethod.GET)
    public String myStudents(ModelMap model, @PathVariable("current") String current) {
        Set<Student> students = feedbackerService.getSupervisedStudents(current);
        List<FeedbackingUnit> studentsNames = new ArrayList<FeedbackingUnit>();
        for (Student student : students) {
            FeedbackingUnit unit = new FeedbackingUnit();
            unit.setStudentName(student.getFirstName() + " " + student.getSecondName());
            unit.setStudentLogin(student.getLogin());
            Review lastReview = studentService.getLastReview(student.getLogin());
            if (lastReview != null) {
                unit.setFeedbackerName(lastReview.getFeedbacker().getFirstName() + " " + lastReview.getFeedbacker().getSecondName());
                unit.setDate(lastReview.getDate().getTime());
            } else {
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
    public String interview(ModelMap model, @PathVariable("current") String current) {
        Set<Student> students = feedbackerService.getInterviewedStudents(current);
        List<FeedbackingUnit> studentsNames = new ArrayList<FeedbackingUnit>();
        for (Student student : students) {
            FeedbackingUnit unit = new FeedbackingUnit();
            unit.setStudentName(student.getFirstName() + " " + student.getSecondName());
            unit.setStudentLogin(student.getLogin());
            Review lastReview = studentService.getLastReview(student.getLogin());
            if (lastReview != null) {
                unit.setFeedbackerName(lastReview.getFeedbacker().getFirstName() + " " + lastReview.getFeedbacker().getSecondName());
                unit.setDate(lastReview.getDate().getTime());
            } else {
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
    public String showCuratorFeedback(@PathVariable("studentLogin") String studentLogin, ModelMap modelMap,
                                      @PathVariable("feedbackerRole") String feedbackerRole, @PathVariable("current") String current) {
        Review review = new Review();
        Student student = studentService.getStudentByLogin(studentLogin);
        review.setStudent(student);
        if (feedbackerRole.equals("asCurator")) {
            review.setFromInterview(false);
        } else {
            review.setFromInterview(true);
        }
        if (studentService.getStatus(studentLogin).equals("STUDYING")) {
            System.out.println(review.getRatings().size());
            List<Technology> techs = new ArrayList<Technology>();
            techs.add(null);
            techs.addAll(technologyService.getAllTechnologies());
            modelMap.addAttribute("review", review);
            modelMap.addAttribute("techologies", techs);
            return "interview";
        }
        modelMap.addAttribute("review", review);
        return "review";
    }

    @RequestMapping(value = "/addFeedback", method = RequestMethod.POST)
    public String addFeedback(@ModelAttribute("review") Review review) {
        studentService.addWorkingReview(review.getStudent().getLogin(), UserService.getCurrentUserLogin(), review);
        return "redirect:/curator/" + UserService.getCurrentUserLogin();
    }


    @RequestMapping(value = "/addRatingReview", method = RequestMethod.POST)
    public String addRatingFeedback(ModelMap modelMap,
                                    @PathVariable("current") String current,
                                    @ModelAttribute("review") Review review) {
        int size = 5;
        for (int i = 0; i < size; i++) {
            if (review.getRatings().get(i).getTechnology().getTechnologyName().equals("")) {
                review.getRatings().remove(i--);
                size--;
            }
        }
        studentService.addStudyingReview(review.getStudent().getLogin(), UserService.getCurrentUserLogin(), review);

        return "redirect:/curator/" + current;
    }

}
