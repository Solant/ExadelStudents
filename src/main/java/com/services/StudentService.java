package com.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import persistance.dao.StudentDao;
import persistance.model.Student;
import persistance.model.UserRole;
import persistance.model.Value;

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
    static public void setValues(String studentLogin, HashMap<String, String> hashMap){
        //Set values
    }

    /**
     * Returns HashMap with all student attributes and values
     *
     * @param studentLogin - Student login
     * @return HashMap<String attributeName, String value>
     */
    @Transactional
    HashMap<String, String> getValues(String studentLogin){
        HashMap<String, String> hashMap = new HashMap<String, String>();
        Student student = studentDao.findByLogin(studentLogin);
        Set<Value> values = student.getValues();
        for (Value value : values){
            hashMap.put(value.getAttribute().getAttributeName(), value.getValue());
        }
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
