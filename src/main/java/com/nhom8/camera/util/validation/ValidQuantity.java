package com.nhom8.camera.util.validation;

import com.nhom8.camera.util.validation.impl.ValidQuantityImpl;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Target({ElementType.FIELD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = ValidQuantityImpl.class)
@Documented
public @interface ValidQuantity {

    String message() default "Must be an number format, between 1 and 5000";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
