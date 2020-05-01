package com.nhom8.camera.util.validation;

import com.nhom8.camera.util.validation.impl.ValidOrderStatusImpl;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Target({ElementType.FIELD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = ValidOrderStatusImpl.class)
@Documented
public @interface ValidOrderStatus {

    String message() default "Order status must be is 'Received', 'Cancelled' or 'Waiting'";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
