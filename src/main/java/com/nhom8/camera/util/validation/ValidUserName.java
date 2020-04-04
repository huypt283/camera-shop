package com.nhom8.camera.util.validation;

import com.nhom8.camera.util.validation.impl.ValidUserNameImpl;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Target({ElementType.FIELD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = ValidUserNameImpl.class)
@Documented
public @interface ValidUserName {

    String message() default "Username already exist";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}