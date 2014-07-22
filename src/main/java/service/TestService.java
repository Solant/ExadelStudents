package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import persistance.dao.StudentDao;
import persistance.model.Student;
import persistance.model.User;

/**
 * Created by user on 18.07.2014.
 */

@Service
public class TestService {
    @Autowired
    private StudentDao sd;

    @Transactional
    public void testMethod(){

        System.out.println("TEST STARTED!");

        Student stud = new Student();
        stud.setLogin("test");
        stud.setPassword("test");
        stud.setFirstName("testFN");
        stud.setSecondName("testSN");
        sd.save(stud);
        for(Student s : sd.findAll()){
            System.out.println(s.getFirstName());
        }

        System.out.println("TEST ENDED!");
    }
}
