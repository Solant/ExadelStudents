package com.services;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import persistance.model.Student;

import java.util.*;

@Service
public class StudentService {
    @Transactional
    static public void add(String login, String password, String surname, String name){
        //Adding Student
    }

    @Transactional
    static public void setValues(String studentLogin, HashMap<String, String> hashMap){
        //Set values
    }

    @Transactional
    static HashMap<String, String> getValues(String studentLogin){
        HashMap<String, String> hashMap = new HashMap<String, String>();
        //Get value
        return hashMap;
    }

    @Transactional
    static void addReview(String studentLogin, String curatorLogin, boolean fromInterview /*some shit here*/){

    }

    static boolean isSameStudent(String studentLogin){
        //Some code, lol
        return true;
    }

    static void addInterviewer(String interviewerLogin, String studentLogin){
        //Some code
    }

    static void addCurator(String interviewerLogin, String studentLogin){
        //Some code
    }

    static void disable(String studentLogin){
        //some code lol
    }

    static void enable(String studentLogin){
        //some code, lol
    }

    static List<Student> find() {
        List<Student> studentList = new ArrayList<Student>();
        return studentList;
    }

}
