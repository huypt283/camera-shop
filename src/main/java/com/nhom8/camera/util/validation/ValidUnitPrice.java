package com.nhom8.camera.util.validation;

import com.nhom8.camera.util.validation.impl.ValidUnitPriceImpl;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Target({ElementType.FIELD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = ValidUnitPriceImpl.class)
@Documented
public @interface ValidUnitPrice {

    String message() default "Must be an number format, between 100,000 VNĐ and 999,999,999 VNĐ";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
