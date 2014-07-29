package com.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import persistance.dao.AttributeDao;

public class AttributeService {
    @Autowired
    private AttributeDao attributeDao;

    @Transactional
    public void addAttribute(String groupName, String attributeName, String valueType){
        //
    }
}
