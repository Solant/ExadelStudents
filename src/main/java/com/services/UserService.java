package com.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import persistance.dao.UserDao;
import persistance.model.User;

public class UserService {

    @Autowired
    private UserDao userDao;

    /**
     * Checks if login is available
     *
     * @param login - User Login
     * @return boolean
     */
    public boolean isLoginAvailable(String login){
        User user = userDao.findByLogin(login);
        if (user == null)
            return false;
        return true;
    }

    /**
     * Returns login of current user from SpringSecurity, non Transactional
     *
     * @return String
     */
    public static String getCurrentUserLogin(){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        return name;
    }
}
