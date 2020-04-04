package com.nhom8.camera.util.validation.impl;

import com.nhom8.camera.service.ProductService;
import com.nhom8.camera.util.validation.ValidProductName;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

@Component
public class ValidProductNameImpl implements ConstraintValidator<ValidProductName, String> {

    @Autowired
    private ProductService productService;

    public void initialize(ValidProductName validProductName) {
    }

    public boolean isValid(String productName, ConstraintValidatorContext constraintValidatorContext) {
        return productService.productNameValid(productName);
    }
}