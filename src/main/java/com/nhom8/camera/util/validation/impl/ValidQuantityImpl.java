package com.nhom8.camera.util.validation.impl;

import com.nhom8.camera.util.validation.ValidQuantity;
import org.springframework.stereotype.Component;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

@Component
public class ValidQuantityImpl implements ConstraintValidator<ValidQuantity, String> {
    public void initialize(ValidQuantity validQuantity) {
    }

    public boolean isValid(String number, ConstraintValidatorContext constraintValidatorContext) {
        try {
            int quantity = Integer.parseInt(number);
            return quantity > 0 && quantity <= 5000;
        } catch (NumberFormatException e) {
            return false;
        }
    }
}
