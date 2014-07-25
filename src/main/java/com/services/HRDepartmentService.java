package com.services;

import org.springframework.beans.factory.annotation.Autowired;

import persistance.dao.HRWorkerDao;

public class HRDepartmentService {

    @Autowired
    private HRWorkerDao hrWorkerDao;

    public static void add(String hrDepartmentLogin, String password, String name, String surname){

    }

    public static void delete(String hrDepartmentLogin){

    }
}
