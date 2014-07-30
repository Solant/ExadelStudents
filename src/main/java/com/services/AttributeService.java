package com.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import persistance.dao.AttributeDao;
import persistance.dao.GroupDao;
import persistance.model.Attribute;

@Service
public class AttributeService {

    @Autowired
    private AttributeDao attributeDao;

    @Autowired
    private GroupDao groupDao;

    @Transactional
    public void addAttribute(String groupName, String attributeName, String valueType){
        Attribute attribute = new Attribute();
        attribute.setGroup(groupDao.findByName(groupName));
        attribute.setType(valueType);
        attribute.setAttributeName(attributeName);
        attributeDao.save(attribute);
    }

    @Transactional
    public void removeAttribute(String attributeName){
        attributeDao.removeById(attributeDao.findByName(attributeName).getId());
    }
}
