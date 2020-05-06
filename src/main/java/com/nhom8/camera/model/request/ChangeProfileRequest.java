package com.nhom8.camera.model.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.validation.annotation.Validated;

import javax.validation.constraints.Email;
import javax.validation.constraints.Size;

@Validated
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ChangeProfileRequest {
    @Email(message = "Must be an email type")
    @Size(min = 10, max = 100, message = "Must be less than 100 characters")
    private String email;

    @Size(min = 10, max = 50, message = "Must be between 6 and 50 characters")
    private String fullName;

    @Size(max = 15, message = "Must be less than 15 characters")
    private String phone;

    @Size(max = 100, message = "Must be less than 100 characters")
    private String address;

    @Size(min = 6, max = 30, message = "Must be between 8 and 30 characters")
    private String currentPassword;
}
