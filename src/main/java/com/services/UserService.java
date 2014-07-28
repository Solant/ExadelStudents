package com.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import persistance.dao.UserDao;
import persistance.model.User;

@Service
public class UserService {

    @Autowired
    private UserDao userDao;

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

    /**
     * Returns login of current user from SpringSecurity, non Transactional
     *
     * @return String
     */
    public static String getCurrentUserLogin(){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        return auth.getName();
    }
}
