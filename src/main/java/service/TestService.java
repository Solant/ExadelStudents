package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import persistance.dao.*;
import persistance.model.*;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


@Service
public class TestService {
    @Autowired
    private StudentDao sd;

    @Autowired
    private FeedbackerDao fd;

    @Autowired
    private UserDao ud;

    @Autowired
    private AttributeDao ad;

    @Autowired
    private GroupDao gd;

    @Transactional
    public void testMethod() {

        System.out.println("TEST STARTED!");

        Student stud = new Student();

        stud.setLogin("test5Stud");
        stud.setPassword("test5Stud");
        stud.setFirstName("test5StudFN");
        stud.setSecondName("test5StudSN");
        sd.save(stud);

        Feedbacker cur1 = new Feedbacker();
        Feedbacker cur2 = new Feedbacker();

        cur1.setLogin("testCur3");
        cur1.setPassword("testCur3");
        cur1.setFirstName("testCur3FN");
        cur1.setSecondName("testCur3SN");

        cur2.setLogin("testCur4");
        cur2.setPassword("testCur4");
        cur2.setFirstName("testCur4FN");
        cur2.setSecondName("testCur4SN");

        stud.getCurators().add(cur1);
        stud.getCurators().add(cur2);

        Group group = new Group();
        group.setName("Institution");
        gd.save(group);

        Attribute attribute1 = new Attribute();
        attribute1.setGroup(group);
        attribute1.setAttributeName("Institution");
        attribute1.setStatus(2);
        attribute1.setType("text");

        Attribute attribute2 = new Attribute();
        attribute2.setGroup(group);
        attribute2.setAttributeName("Faculty");
        attribute2.setStatus(2);
        attribute2.setType("text");

        ad.save(attribute1);
        ad.save(attribute2);

        Value value = new Value();
        value.setAttribute(attribute1);
        value.setValue("BSU");
        value.setStudent(stud);

        Value value2 = new Value();
        value2.setAttribute(attribute2);
        value2.setValue("FAMCS");
        value2.setStudent(stud);

        Set<Value> values = new HashSet();
        values.add(value);
        values.add(value2);

        stud.setValues(values);
        sd.update(stud);


        UserRole ur = new UserRole();
        ur.setRole("ROLE_STUDENT");
        ur.setUser(stud);

        UserRole ur2 = new UserRole();
        ur2.setRole("ROLE_ADMIN");
        ur2.setUser(stud);

        stud.getUserRoles().add(ur);
        stud.getUserRoles().add(ur2);

        sd.update(stud);

        // -----------------------------------------------
        for (User u : ud.findAll()) {
            System.out.println("U- " + u.getLogin());
        }

        for (Student student : sd.findAll()) {
            System.out.println("S- " + student.getLogin());
        }

        for (Feedbacker feedb : fd.findAll()) {
            System.out.println("F- " + feedb.getLogin());
        }
     //   gd.removeById((long)8);

        System.out.println("TEST ENDED!");
    }
}