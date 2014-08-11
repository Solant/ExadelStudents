package com.services;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import persistance.dao.GroupDao;
import persistance.model.Group;

import java.util.ArrayList;
import java.util.List;

@Service
public class GroupService {

    @Autowired
    private GroupDao groupDao;

    @Transactional
    public void addGroup(String groupName, String status){
        Group group = new Group();
        group.setName(groupName);
        group.setStatus(status);
        groupDao.save(group);
    }

    @Transactional
    public void deleteGroup(String groupName){
        groupDao.removeById(groupDao.findByName(groupName).getId());
    }

    @Transactional
    public void setStatus(String groupName, String status){
        Group group = groupDao.findByName(groupName);
        group.setStatus(status);
        groupDao.update(group);
    }

    @Transactional
    public List<String> getAllGroups(){
        List<String> groupsReturn = new ArrayList<String>();
        List<Group> groups = groupDao.findAll();
        for (Group group : groups){
            groupsReturn.add(group.getName());
        }
        return groupsReturn;
    }

    @Transactional
    public Group getGroupByName(String name){
        return groupDao.findByName(name);
    }

    @Transactional
    public boolean isAvailable(String group){
        return groupDao.findByName(group) == null;
    }

    @Transactional
    public void updateGroup(String oldGroupName, String groupName, String status){
        Group group = groupDao.findByName(oldGroupName);
        group.setName(groupName);
        group.setStatus(status);
        groupDao.update(group);
    }
}
