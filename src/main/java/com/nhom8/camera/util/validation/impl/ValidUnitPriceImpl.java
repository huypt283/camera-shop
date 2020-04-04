package com.nhom8.camera.util.validation.impl;

import com.nhom8.camera.util.validation.ValidUnitPrice;
import org.springframework.stereotype.Component;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

@Component
public class ValidUnitPriceImpl implements ConstraintValidator<ValidUnitPrice, String> {
    public void initialize(ValidUnitPrice validUnitPrice) {
    }

    public boolean isValid(String number, ConstraintValidatorContext constraintValidatorContext) {
        try {
            long unitPrice = Long.parseLong(number);
            return unitPrice >= 100000 && unitPrice < 1000000000;
        } catch (NumberFormatException e) {
            return false;
        }
    }
}
