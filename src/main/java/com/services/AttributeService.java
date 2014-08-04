package com.services;

import com.services.presentation.GAVPresentation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.w3c.dom.Attr;
import persistance.dao.AttributeDao;
import persistance.dao.GroupDao;
import persistance.model.Attribute;
import persistance.model.Group;
import persistance.model.Value;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

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

    @Transactional
    public List<GAVPresentation> getAllAttributes(){
        List<Group> groups = groupDao.findAll();
        List<GAVPresentation> gavs = new ArrayList<GAVPresentation>();
        for(Group group : groups){
            Set<Attribute> attributes = group.getAttributes();
            for(Attribute attribute : attributes){
                Set<Value> values = attribute.getValues();
                GAVPresentation gav = new GAVPresentation();
                gav.setGroup(group.getName());
                gav.setAttribute(attribute.getAttributeName());
                gav.setType(attribute.getType());
                gavs.add(gav);
            }
        }
        return gavs;
    }

    @Transactional
    public boolean isAttributeAvailable(String attribute){
        return attributeDao.findByName(attribute) == null;
    }
}
