package com.View.validators;

import com.View.UserUnit;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class UserFormValidator implements Validator {

    @Override
    public boolean supports(Class c) {
        return UserUnit.class.isAssignableFrom(c);
    }

    @Override
    public void validate(Object command, Errors errors) {
    }

}
