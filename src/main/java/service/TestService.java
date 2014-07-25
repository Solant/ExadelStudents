package service;

import com.services.StudentService;
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

    public void testMethod() {

        System.out.println("TEST STARTED!");
        //sd.findAll();
        StudentService ss = new StudentService();


        System.out.println("TEST ENDED!");
    }
}