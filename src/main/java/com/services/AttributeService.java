package com.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.w3c.dom.Attr;
import persistance.dao.AttributeDao;
import persistance.dao.GroupDao;
import persistance.model.Attribute;
import persistance.model.Group;

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
}
