package com.services;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import persistance.dao.FeedbackerDao;
import persistance.model.Feedbacker;
import persistance.model.Student;
import persistance.model.UserRole;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Service
public class FeedbackerService {

    @Autowired
    private FeedbackerDao feedbackerDao;

    @Transactional
    public Feedbacker getFeedbackerByLogin(String login){
        return feedbackerDao.findByLogin(login);
    }

    @Transactional
    public void add(String login, String password, String name, String surname){
        Feedbacker feedbacker = new Feedbacker();

        feedbacker.setLogin(login);
        feedbacker.setPassword(password);
        feedbacker.setFirstName(name);
        feedbacker.setSecondName(surname);

        UserRole ur = new UserRole();
        ur.setRole("ROLE_CURATOR");
        ur.setUser(feedbacker);
        feedbacker.getUserRoles().add(ur);

        feedbackerDao.save(feedbacker);
    }

    @Transactional
    public void delete(String login){
        Feedbacker feedbacker = feedbackerDao.findByLogin(login);
        feedbackerDao.removeById(feedbacker.getId());
    }

    @Transactional
    public List<String> getSupervisedStudents(String feedbackerLogin){
        List<String> students = new ArrayList<String>();
        Set<Student> studentsSet = feedbackerDao.findByLogin(feedbackerLogin).getMyStudents();
        for (Student student : studentsSet)
            students.add(student.getLogin());
        return students;
    }

    @Transactional
    public List<String> getInterviewedStudents(String feedbackerLogin){
        List<String> students = new ArrayList<String>();
        Set<Student> studentSet = feedbackerDao.findByLogin(feedbackerLogin).getInterviewedStudents();
        for (Student student : studentSet)
            students.add(student.getLogin());
        return  students;
    }
}
