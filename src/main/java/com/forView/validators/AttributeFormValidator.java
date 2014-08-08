package com.forView.validators;

import com.forView.Group;
import com.forView.GroupedValues;
import com.services.AttributeService;
import com.services.UserService;
import com.services.presentation.GAVPresentation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import persistance.model.Attribute;


@Component
public class AttributeFormValidator implements Validator {

    @Autowired
    private AttributeService attributeService;

    @Autowired
    UserService userService;

    @Override
    public boolean supports(Class c) {
        return GroupedValues.class.isAssignableFrom(c);
    }

    @Override
    public void validate(Object command, Errors errors) {
        GroupedValues groupedValues = (GroupedValues) command;
        for (Group group : groupedValues.getValuesArray()) {
            for (GAVPresentation gavPresentation : group.getGavs()) {
                Attribute attribute = attributeService.getByName(gavPresentation.getAttribute());
                if (gavPresentation.getValue() != null && attribute.getPattern() != null) {
                    System.out.println(gavPresentation.getValue()+" "+
                            attribute.getPattern()+" "+gavPresentation.getValue().matches(attribute.getPattern()));
                    if (!gavPresentation.getValue().matches(attribute.getPattern()))
                        errors.reject("any_attribute_error_message", attribute.getErrorMessage());

                }
            }
        }
    }
}
