package com.nhom8.camera.model.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@AllArgsConstructor
@NoArgsConstructor
public class UserRegisterRequest {
    private String userName;
    private String fullName;
    private String email;
    private String phone;
    private String password;
}
