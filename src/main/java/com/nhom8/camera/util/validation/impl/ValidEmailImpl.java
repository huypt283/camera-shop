package com.nhom8.camera.util.validation.impl;

import com.nhom8.camera.service.UserService;
import com.nhom8.camera.util.validation.ValidEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

@Component
public class ValidEmailImpl implements ConstraintValidator<ValidEmail, String> {
    @Autowired
    private UserService userService;

    public void initialize(ValidEmail validEmail) {
    }

    public boolean isValid(String email, ConstraintValidatorContext constraintValidatorContext) {
        return userService.emailValid(email);
    }
}
