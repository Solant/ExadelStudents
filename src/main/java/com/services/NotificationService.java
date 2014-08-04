package com.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import persistance.dao.NotificationDao;
import persistance.dao.UserDao;
import persistance.model.Notification;

import java.util.Calendar;

@Service
public class NotificationService {

    @Autowired
    private NotificationDao notificationDao;

    @Autowired
    private UserDao userDao;

    @Transactional
    public void add(String sender, String recipient, String title, String text){
        Notification n = new Notification();
        n.setRead(false);
        n.setSender(sender);
        n.setUser(userDao.findByLogin(recipient));
        n.setTitle(title);
        n.setTimeWhenSent(Calendar.getInstance());
        n.setText(text);
        notificationDao.save(n);
    }

    /**
     * Sets notification as read and sets read time (Automatically)
     *
     * @param id notification ID
     */
    @Transactional
    public void setRead(long id){
        Notification n = notificationDao.findById(id);
        n.setRead(true);
        n.setTimeWhenRead(Calendar.getInstance());
        notificationDao.update(n);
    }

    @Transactional
    public Notification getNotificationById(long id){
        return notificationDao.findById(id);
    }


}
