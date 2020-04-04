package com.nhom8.camera.util.validation.impl;

import com.nhom8.camera.service.UserService;
import com.nhom8.camera.util.validation.ValidUserName;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

@Component
public class ValidUserNameImpl implements ConstraintValidator<ValidUserName, String> {

    @Autowired
    private UserService userService;

    public void initialize(ValidUserName validUserName) {
    }

    public boolean isValid(String username, ConstraintValidatorContext constraintValidatorContext) {
        return userService.userNameValid(username);
    }
}