package com.View.validators;

import com.View.AccountUnit;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class AccountFormValidator implements Validator {

    @Override
    public boolean supports(Class c) {
        return AccountUnit.class.isAssignableFrom(c);
    }

    @Override
    public void validate(Object command, Errors errors) {
        AccountUnit accUnit = (AccountUnit) command;
        if (!accUnit.getNewPassword().equals(accUnit.getConfirmedPassword()))
            errors.rejectValue("confirmedPassword", "password.notmatch", "Password and retype password do not match");
    }

}
