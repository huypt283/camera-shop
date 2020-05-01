package com.nhom8.camera.util.validation.impl;

import com.nhom8.camera.util.validation.ValidOrderStatus;
import org.springframework.stereotype.Component;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

@Component
public class ValidOrderStatusImpl implements ConstraintValidator<ValidOrderStatus, String> {
    public void initialize(ValidOrderStatus validEmail) {
    }

    public boolean isValid(String status, ConstraintValidatorContext constraintValidatorContext) {
        return (status.equalsIgnoreCase("Received") || status.equalsIgnoreCase("Cancelled")
                || status.equalsIgnoreCase("Waiting"));
    }
}
