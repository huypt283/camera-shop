package com.nhom8.camera.util.validation;

import com.nhom8.camera.util.validation.impl.ValidProductNameImpl;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Target({ElementType.FIELD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = ValidProductNameImpl.class)
@Documented
public @interface ValidProductName {

    String message() default "Product name already exist";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}