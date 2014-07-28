package com.services;

import org.springframework.beans.factory.annotation.Autowired;

import persistance.dao.FeedbackerDao;
import persistance.model.Feedbacker;
import persistance.model.UserRole;

/**
 * Created by solant on 24.07.14.
 */
public class FeedbackerService {
    @Autowired
    private FeedbackerDao feedbackerDao;

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
}
