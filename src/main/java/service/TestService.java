package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import persistance.dao.*;
import persistance.model.Attribute;
import persistance.model.Group;


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
        Group group = new Group();
        group.setName("Institution");
        group.setStatus("for_everybody");
        gd.save(group);

        Group group2 = new Group();
        group2.setName("Work");
        group2.setStatus("WORKYING");
        gd.save(group2);

        Attribute attribute = new Attribute();
        attribute.setGroup(group);
        attribute.setAttributeName("University");
        attribute.setStatus("for_everybody");
        ad.save(attribute);

        Attribute attribute1 = new Attribute();
        attribute1.setGroup(group);
        attribute1.setAttributeName("Faculty");
        attribute1.setStatus("for_everybody");
        ad.save(attribute1);

        Attribute attribute2 = new Attribute();
        attribute2.setGroup(group2);
        attribute2.setStatus("for_everybody");
        attribute2.setAttributeName("Project");
        ad.save(attribute2);


        System.out.println("TEST ENDED!");
    }
}