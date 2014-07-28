package com.services;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import persistance.dao.FeedbackerDao;
import persistance.model.Feedbacker;
import persistance.model.UserRole;

@Service
public class FeedbackerService {

    @Autowired
    private FeedbackerDao feedbackerDao;

    @Transactional
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

    @Transactional
    public void delete(String login){
        Feedbacker feedbacker = feedbackerDao.findByLogin(login);
        feedbackerDao.removeById(feedbacker.getId());
    }
}
