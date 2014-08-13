package com.services;

import com.forView.JSONUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import persistance.dao.NotificationDao;
import persistance.dao.UserDao;
import persistance.model.Notification;
import persistance.model.User;
import persistance.model.UserRole;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private NotificationDao notificationDao;

    /**
     * Checks if login is available
     *
     * @param login - User Login
     * @return boolean
     */
    @Transactional
    public boolean isLoginAvailable(String login){
        User user = userDao.findByLogin(login);
        return user == null;
    }

    @Transactional
    public void update(User user){
        userDao.update(user);
    }

    /**
     * Returns login of current user from SpringSecurity, non Transactional
     *
     * @return String
     */
    public static String getCurrentUserLogin(){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        return auth.getName();
    }

    @Transactional
    public String getFirstName(String login){
        return userDao.findByLogin(login).getFirstName();
    }

    @Transactional
    public String getSecondName(String login){
        return userDao.findByLogin(login).getSecondName();
    }

    @Transactional
    public void setPassword(String login, String pass){
        User user = userDao.findByLogin(login);
        user.setPassword(stringToSha256(pass));
        userDao.update(user);
    }

    public static String stringToSha256(String password){
        return org.apache.commons.codec.digest.DigestUtils.sha256Hex(password);
    }

    /**
     * Get all notifications for user
     *
     * @param login Student login
     * @return List<Notification>
     */
    @Transactional
    public List<Notification> getAllNotifications(String login) {
        List<Notification> notifications = notificationDao.findAll();
        List<Notification> notificationsReturn = new ArrayList<Notification>();
        for (Notification notification : notifications)
            if (notification.getUser().getLogin().equalsIgnoreCase(login))
                notificationsReturn.add(notification);
        return notificationsReturn;
    }

    @Transactional
    public User getByLogin(String login){
        return userDao.findByLogin(login);
    }

    @Transactional
    public List<Notification> getAllUnreadNotifications(String login) {
        List<Notification> notifications = notificationDao.findAll();
        List<Notification> notificationsRet = new ArrayList<Notification>();
        for (Notification notification : notifications)
            if (!notification.isRead() && notification.getUser().getLogin().equalsIgnoreCase(login))
                notificationsRet.add(notification);
        return notificationsRet;
    }

    @Transactional
    public void delete (String login){
        if(userDao.findByLogin(login)!=null)
            userDao.removeById(userDao.findByLogin(login).getId());
    }

    @Transactional
    public List<JSONUser> getAllWithRole (String role) {
        List<User> users = userDao.findAll();
        List<JSONUser> result = new ArrayList<JSONUser>();
        for (User user : users) {
            for(UserRole ur : user.getUserRoles()) {
                if (ur.getRole().equals(role)) {
                    JSONUser jsonUser = new JSONUser();
                    jsonUser.setLogin(user.getLogin());
                    jsonUser.setSecondName(user.getSecondName());
                    jsonUser.setFirstName(user.getFirstName());
                    result.add(jsonUser);
                }
            }
        }
        return result;
    }
}
