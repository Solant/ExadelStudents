package com.services;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import persistance.dao.FeedbackerDao;
import persistance.model.Feedbacker;
import persistance.model.Student;
import persistance.model.UserRole;

import java.util.ArrayList;
import java.util.Set;

@Service
public class FeedbackerService {

    @Autowired
    private FeedbackerDao feedbackerDao;

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
    public ArrayList<String> getStudents(String feedbackerLogin){
        ArrayList<String> students = new ArrayList<String>();
        Feedbacker feedbacker = feedbackerDao.findByLogin(feedbackerLogin);
        Set<Student> studentsSet = feedbacker.getMyStudents();
        for (Student student : studentsSet)
            students.add(student.getLogin());
        return students;
    }
}
