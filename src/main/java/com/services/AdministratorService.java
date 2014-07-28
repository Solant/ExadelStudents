package com.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import persistance.dao.AdminDao;
import persistance.model.Admin;
import persistance.model.UserRole;

@Service
public class AdministratorService {

    @Autowired
    private AdminDao adminDao;

    @Transactional
    public void add(String login, String password, String name, String surname){
        Admin admin = new Admin();
        admin.setLogin(login);
        admin.setPassword(password);
        admin.setFirstName(name);
        admin.setSecondName(surname);
        UserRole ur = new UserRole();
        ur.setRole("ROLE_ADMIN");
        ur.setUser(admin);
        admin.getUserRoles().add(ur);
        adminDao.save(admin);
    }
}
