package com.nhom8.camera.model;

import lombok.Getter;
import lombok.Setter;
import org.springframework.validation.annotation.Validated;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

@Getter @Setter
@Validated
public class LoginRequest {
    @Email(message = "Must is email type")
    private String email;

    @NotBlank(message = "Can not empty")
    private String password;
}
