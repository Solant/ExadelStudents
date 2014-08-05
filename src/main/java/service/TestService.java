package service;

import com.services.validation.ValidatorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import persistance.dao.*;
import persistance.model.*;

import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;
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

    @Autowired
    private TechnologyDao td;

    @Autowired
    private RatingDao rd;

    @Autowired
    private ReviewDao rewd;

    @Transactional
    public void testMethod() {

        System.out.println("TEST STARTED!");

        Validator validator =  Validation.buildDefaultValidatorFactory().getValidator();
        Student invalidStud = new Student();
        invalidStud.setEmail("al@email");
        invalidStud.setLogin("login");
        invalidStud.setPassword("password");
        invalidStud.setFirstName("ibn Se-asdr");
        invalidStud.setSecondName("ibn Se-asdr");
        invalidStud.setTelephone("+375(29)213-21-23");
        UserRole ur = new UserRole();
        ur.setRole("ROLE_ADMIN");

        UserRole ur2 = new UserRole();
        ur2.setRole("ROLE_ALESHA");
        invalidStud.getUserRoles().add(ur);

        invalidStud.getUserRoles().add(ur2);
        List<String> errors = ValidatorService.getErrors(invalidStud, validator);
        for(String error : errors){
            System.out.println(error);
        }

        /*
        Student stud = new Student();
        Set<Student> studs = new HashSet<Student> ();
        studs.add(stud);

        System.out.println(stud.getSkype());
        for(Student s: studs){
            s.setSkype("ALESHA");
        }
        System.out.println(stud.getSkype());

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

        fd.save(cur1);
        fd.save(cur2);

        Group group = new Group();
        group.setName("Institution");
        gd.save(group);

        Attribute attribute1 = new Attribute();
        attribute1.setGroup(group);
        attribute1.setAttributeName("Institution");
        attribute1.setStatus("for_everybody");
        attribute1.setType("text");

        Attribute attribute2 = new Attribute();
        attribute2.setGroup(group);
        attribute2.setAttributeName("Faculty");
        attribute2.setStatus("for_everybody");
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

        Review review1 = new Review();
        Review review2 = new Review();

        review1.setStudent(stud);
        review1.setFeedbacker(cur1);
        review1.setComment("BLA BLA BLA");
        rewd.save(review1);

        review2.setStudent(stud);
        review2.setFeedbacker(cur2);
        review2.setComment("BLA BLA BLA BLA");
        rewd.save(review2);

//----------------------------------------------------------------------
        Technology technology1 = new Technology();
        Technology technology2 = new Technology();
        Technology technology3 = new Technology();

        technology1.setTechnologyName("Java");
        technology2.setTechnologyName("HTML");
        technology3.setTechnologyName("CSS");

        td.save(technology1);
        td.save(technology2);
        td.save(technology3);

        Rating rating1 = new Rating();
        Rating rating2 = new Rating();
        Rating rating3 = new Rating();

        rating1.setRating((short)8);
        rating1.setTechnology(technology1);
        rating1.setReview(review1);

        rating2.setRating((short)2);
        rating2.setTechnology(technology1);
        rating2.setReview(review2);

        rating3.setTechnology(technology2);
        rating3.setReview(review1);
        rating3.setRating((short)3);

        rd.save(rating1);
        rd.save(rating2);
        rd.save(rating3);


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
*/
        System.out.println("TEST ENDED!");
    }
}