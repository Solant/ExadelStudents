package com.services;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import persistance.dao.HRWorkerDao;
import persistance.model.HRWorker;
import persistance.model.UserRole;

@Service
public class HRWorkerService {

    @Autowired
    private HRWorkerDao hrWorkerDao;

    @Transactional
    public void add(String hrDepartmentLogin, String password, String name, String surname){
        HRWorker worker = new HRWorker();
        worker.setLogin(hrDepartmentLogin);
        worker.setPassword(password);
        worker.setFirstName(name);
        worker.setSecondName(surname);

        UserRole ur = new UserRole();
        ur.setRole("ROLE_WORKER");
        ur.setUser(worker);

        worker.getUserRoles().add(ur);
        hrWorkerDao.save(worker);
    }

    public void delete(String hrDepartmentLogin){
        HRWorker worker = hrWorkerDao.findByLogin(hrDepartmentLogin);
        hrWorkerDao.removeById(worker.getId());
    }
}
