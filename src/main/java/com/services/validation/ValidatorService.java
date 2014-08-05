package com.services.validation;

import javax.validation.ConstraintViolation;
import javax.validation.Validator;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class ValidatorService {
    public static List<String> getErrors(Object object, Validator validator) {
        Set<ConstraintViolation<Object>> constraintViolations = validator
                .validate(object);

        List errors = new ArrayList();

        for (ConstraintViolation<Object> cv : constraintViolations)
            errors.add(String.format(
                    "Error! property: %s, value: %s, message: %s",
                    cv.getPropertyPath(), cv.getInvalidValue(), cv.getMessage()));
        return errors;
    }
}
