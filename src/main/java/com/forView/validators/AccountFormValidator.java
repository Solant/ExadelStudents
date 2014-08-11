package com.forView.validators;

import com.forView.AccountUnit;
import com.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class AccountFormValidator implements Validator {

    @Autowired
    private UserService userService;

    @Override
    public boolean supports(Class c) {
        return AccountUnit.class.isAssignableFrom(c);
    }

    @Override
    public void validate(Object command, Errors errors) {

        AccountUnit accUnit = (AccountUnit) command;
        if(accUnit.getNewPassword()==null)
            return;
        if (!accUnit.getNewPassword().equals(accUnit.getConfirmedPassword()))
            errors.rejectValue("confirmedPassword", "password.notmatch", "Password and retype password do not match");
        if(accUnit.getPassword() != null) {
            if (!UserService.stringToSha256(accUnit.getPassword()).equals
                    (userService.getByLogin(accUnit.getLogin()).getPassword()) &&
                    !accUnit.getNewPassword().equalsIgnoreCase("") &&
                    accUnit.getNewPassword() != null)
                errors.reject(/*"password",*/ "oldpassword.wrong", "Old password is wrong.");
        }

    }

}
