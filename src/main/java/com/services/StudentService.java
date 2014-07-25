package com.services;

import com.services.presentation.GAVPresentation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import persistance.dao.StudentDao;
import persistance.model.*;

import java.util.*;

@Service
public class StudentService {

    @Autowired
    private StudentDao studentDao;

    /**
     * Creates new student
     *
     * @param login - Student login
     * @param password - Student password
     * @param name - Student name
     * @param surname - Student second name
     *
     */

    @Transactional
    public void add(String login, String password, String name, String surname){
        Student student = new Student();

        student.setLogin(login);
        student.setPassword(password);
        student.setFirstName(name);
        student.setSecondName(surname);

        UserRole ur = new UserRole();
        ur.setRole("ROLE_STUDENT");
        ur.setUser(student);
        student.getUserRoles().add(ur);

        studentDao.save(student);
    }

    @Transactional
    public void setValues(String studentLogin, HashMap<String, String> hashMap){
        //Set values
    }

    /**
     * Returns ArrayList of GAVPresentation with all student attribute groups, attributes and values
     *
     * @param studentLogin - Student login
     * @return ArrayList<GAVPresentation>
     */
    @Transactional
    public ArrayList<GAVPresentation> getValues(String studentLogin){
        ArrayList<GAVPresentation> wow = new ArrayList<GAVPresentation>();
        Student student = studentDao.findByLogin(studentLogin);
        Set<Value> values = student.getValues();
        for (Value value : values){
            GAVPresentation gav = new GAVPresentation();
            gav.setAttribute(value.getAttribute().getAttributeName());
            gav.setValue(value.getValue());
            gav.setGroup(value.getAttribute().getGroup().getName());
            wow.add(gav);
        }
        return wow;
    }

    @Transactional
    void addReview(String studentLogin, String curatorLogin, boolean fromInterview /*some shit here*/){

    }

    void addInterviewer(String interviewerLogin, String studentLogin){
        //Some code
    }

    void addCurator(String interviewerLogin, String studentLogin){
        //Some code
    }

    /**
     * Disable user
     *
     * @param studentLogin - Student Login
     */
    void disable(String studentLogin){
        Student student = studentDao.findByLogin(studentLogin);
        student.setEnabled(false);

        studentDao.update(student);
    }

    /**
     * Enable user
     * @param studentLogin - Student login
     */
    void enable(String studentLogin){
        Student student = studentDao.findByLogin(studentLogin);
        student.setEnabled(true);

        studentDao.update(student);
    }

    List<Student> find() {
        List<Student> studentList = new ArrayList<Student>();
        return studentList;
    }

}
