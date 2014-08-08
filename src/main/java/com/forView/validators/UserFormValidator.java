package com.forView.validators;

import com.forView.UserUnit;
import com.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class UserFormValidator implements Validator {

    @Autowired
    private UserService userService;

    @Override
    public boolean supports(Class c) {
        return UserUnit.class.isAssignableFrom(c);
    }

    @Override
    public void validate(Object command, Errors errors) {
        UserUnit userUnit = (UserUnit) command;
        if(!userService.isLoginAvailable(userUnit.getLogin())){
            errors.rejectValue("login", "login.inDB", "This login is already in database.");
        }
    }

}
