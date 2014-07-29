package com.services;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import persistance.dao.GroupDao;
import persistance.model.Group;

public class GroupService {

    @Autowired
    private GroupDao groupDao;

    @Transactional
    public void addGroup(String groupName, String status){
        Group group = new Group();
        group.setName(groupName);
        //group set status
        groupDao.save(group);
    }

    @Transactional
    public void deleteGroup(String groupName){

    }
}
