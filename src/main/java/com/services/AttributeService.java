package com.services;

import com.forView.JSONField;
import com.services.presentation.GAVPresentation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import persistance.dao.AttributeDao;
import persistance.dao.GroupDao;
import persistance.model.Attribute;
import persistance.model.Group;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;

@Service
public class AttributeService {

    @Autowired
    private AttributeDao attributeDao;

    @Autowired
    private GroupDao groupDao;

    @Transactional
    public void addAttribute(String groupName, String attributeName, String valueType, String possibleValues,
                             String pattern, String errorMessage){
        Attribute attribute = new Attribute();
        attribute.setGroup(groupDao.findByName(groupName));
        attribute.setType(valueType);
        attribute.setAttributeName(attributeName);
        attribute.setPossibleValues(possibleValues);
        attribute.setPattern(pattern);
        attribute.setErrorMessage(errorMessage);
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
                GAVPresentation gav = new GAVPresentation();
                gav.setGroup(group.getName());
                gav.setAttribute(attribute.getAttributeName());
                gav.setType(attribute.getType());
                gav.setPossibleValues(attribute.getPossibleValues());
                gavs.add(gav);
            }
        }

        Collections.sort(gavs);
        return gavs;
    }

    @Transactional
    public Attribute getByName(String name){
        return attributeDao.findByName(name);
    }

    @Transactional
    public void updateAttribute(String oldAttributeName, String groupName, String attributeName, String valueType, String possibleValues,
                                String pattern, String errorMessage){
        Attribute attribute = attributeDao.findByName(oldAttributeName);
        attribute.setGroup(groupDao.findByName(groupName));
        attribute.setType(valueType);
        attribute.setAttributeName(attributeName);
        attribute.setPossibleValues(possibleValues);
        attribute.setPattern(pattern);
        attribute.setErrorMessage(errorMessage);
        attributeDao.update(attribute);
    }
    @Transactional
    public JSONField getJSONField(String attributeName){
        JSONField jsonField = new JSONField();
        Attribute attribute = attributeDao.findByName(attributeName);
        jsonField.setType(attribute.getType());
        jsonField.setGroupName(attribute.getGroup().getName());
        jsonField.setPossibleValues(attribute.getPossibleValues());

        if(attribute.getPattern()!=null) {
            if (attribute.getPattern().equals("^[0-9]*$"))
                jsonField.setValueType("number");

            if (attribute.getPattern().equals("^[A-Za-z//s//-//.]*$"))
                jsonField.setValueType("fullName");

            if (attribute.getPattern().equals("^[A-Za-z//s]*$"))
                jsonField.setValueType("symbolsOnly");
        }
        return jsonField;
    }
}
