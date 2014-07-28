package com.services;

import com.services.presentation.GAVPresentation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import persistance.dao.AttributeDao;
import persistance.dao.FeedbackerDao;
import persistance.dao.ReviewDao;
import persistance.dao.StudentDao;
import persistance.model.*;

import java.util.*;

@Service
public class StudentService {

    @Autowired
    private StudentDao studentDao;

    @Autowired
    private AttributeDao attributeDao;

    @Autowired
    private FeedbackerDao feedbackerDao;

    @Autowired
    private ReviewDao reviewDao;
    
    /**
     * Creates new student
     *
     * @param login    - Student login
     * @param password - Student password
     * @param name     - Student name
     * @param surname  - Student second name
     */
    @Transactional
    public void add(String login, String password, String name, String surname) {
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

    /**
     * Sets student values
     *
     * @param studentLogin - Student login
     * @param gavList - ArrayList of GAVPresentation
     */
    @Transactional
    public void setValues(String studentLogin, ArrayList<GAVPresentation> gavList) {
        Student student = studentDao.findByLogin(studentLogin);
        Set<Value> values = new HashSet<Value>();
        for (GAVPresentation gav : gavList) {
            Value v = new Value();
            v.setValue(gav.getValue());
            v.setStudent(student);
            v.setAttribute(attributeDao.findByName(gav.getAttribute()));
            values.add(v);
        }
        student.getValues().clear();

        student.getValues().addAll(values);
        studentDao.update(student);
    }

    /**
     * Returns ArrayList of GAVPresentation with all student attribute groups, attributes and values
     *
     * @param studentLogin - Student login
     * @return ArrayList<GAVPresentation>
     */
    @Transactional
    public ArrayList<GAVPresentation> getValues(String studentLogin) {
        ArrayList<GAVPresentation> wow = new ArrayList<GAVPresentation>();
        Student student = studentDao.findByLogin(studentLogin);
        Set<Value> values = student.getValues();
        for (Value value : values) {
            GAVPresentation gav = new GAVPresentation();

            gav.setAttribute(value.getAttribute().getAttributeName());
            gav.setValue(value.getValue());
            gav.setGroup(value.getAttribute().getGroup().getName());
            gav.setType(value.getAttribute().getType());

            wow.add(gav);
        }
        return wow;
    }

    @Transactional
    public void addReview(String studentLogin, String curatorLogin, Review review) {
        review.setFeedbacker(feedbackerDao.findByLogin(curatorLogin));
        review.setStudent(studentDao.findByLogin(studentLogin));
        review.setDate(Calendar.getInstance());

        reviewDao.save(review);
    }

    /**
     * Add Interviewer for a student
     * @param interviewerLogin - Interviewer's login
     * @param studentLogin - - Student's login
     */
    @Transactional
    void addInterviewer(String interviewerLogin, String studentLogin) {
        Student student = studentDao.findByLogin(studentLogin);
        Feedbacker feedbacker = feedbackerDao.findByLogin(interviewerLogin);
        student.getInterviewers().add(feedbacker);

        studentDao.update(student);
    }

    /**
     * Add curator for a student
     *
     * @param interviewerLogin - Curator's login
     * @param studentLogin - Student's login
     */
    @Transactional
    void addCurator(String interviewerLogin, String studentLogin) {
        Student student = studentDao.findByLogin(studentLogin);
        Feedbacker feedbacker = feedbackerDao.findByLogin(interviewerLogin);
        student.getCurators().add(feedbacker);

        studentDao.update(student);
    }

    /**
     * Disable user
     *
     * @param studentLogin - Student Login
     */
    @Transactional
    void disable(String studentLogin) {
        Student student = studentDao.findByLogin(studentLogin);
        student.setEnabled(false);

        studentDao.update(student);
    }

    /**
     * Enable user
     *
     * @param studentLogin - Student login
     */
    @Transactional
    void enable(String studentLogin) {
        Student student = studentDao.findByLogin(studentLogin);
        student.setEnabled(true);

        studentDao.update(student);
    }

    @Transactional
    List<Student> find() {
        List<Student> studentList = new ArrayList<Student>();
        return studentList;
    }

}
