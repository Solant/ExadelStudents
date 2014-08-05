package com.View.validators;

import com.View.AccountUnit;
import com.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class AccountFormValidator implements Validator {

    @Autowired
    UserService userService;

    @Override
    public boolean supports(Class c) {
        return AccountUnit.class.isAssignableFrom(c);
    }

    @Override
    public void validate(Object command, Errors errors) {
        AccountUnit accUnit = (AccountUnit) command;
        if (!accUnit.getNewPassword().equals(accUnit.getConfirmedPassword()))
            errors.rejectValue("confirmedPassword", "password.notmatch", "Password and retype password do not match");
        System.out.println("New password" + accUnit.getNewPassword() + accUnit.getNewPassword().equalsIgnoreCase(""));
        if (!UserService.stringToSha256(accUnit.getPassword()).equals
                (userService.getByLogin(accUnit.getLogin()).getPassword()) &&
                !accUnit.getNewPassword().equalsIgnoreCase("") &&
                accUnit.getNewPassword() != null)
            errors.rejectValue("password", "oldpassword.wrong", "Old password is wrong.");
    }

}
