package com.nhom8.camera.model.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.validation.annotation.Validated;

import javax.validation.constraints.Size;

@Validated
@Getter @Setter
@NoArgsConstructor @AllArgsConstructor
public class ChangePasswordRequest {
    @Size(min = 6, max = 30, message = "Must be between 8 and 30 characters")
    private String oldPassword;

    @Size(min = 8, max = 30, message = "Must be between 8 and 30 characters")
    private String password;
}
