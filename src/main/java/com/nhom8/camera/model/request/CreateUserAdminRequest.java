package com.nhom8.camera.model.request;

import com.nhom8.camera.util.validation.ValidEmail;
import com.nhom8.camera.util.validation.ValidUserName;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.validation.annotation.Validated;

import javax.validation.constraints.Email;
import javax.validation.constraints.Size;
import java.util.Set;

@Validated
@Getter @Setter
@NoArgsConstructor @AllArgsConstructor
public class CreateUserAdminRequest {
    @Size(min = 3, max = 50, message = "Must be between 3 and 50 characters")
    @ValidUserName
    private String userName;

    @Size(min = 10, max = 50, message = "Must be between 6 and 50 characters")
    private String fullName;

    @Email(message = "Must be an email type")
    @Size(min = 10, max = 100, message = "Must be less than 100 characters")
    @ValidEmail
    private String email;

    @Size(min = 6, max = 30, message = "Must be between 6 and 30 characters")
    private String password;

    @Size(max = 15, message = "Must be less than 15 characters")
    private String phone;

    @Size(max = 100, message = "Must be less than 100 characters")
    private String address;

    private Set<Long> ids;
}
