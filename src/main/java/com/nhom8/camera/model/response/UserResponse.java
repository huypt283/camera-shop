package com.nhom8.camera.model.response;

import com.nhom8.camera.entity.Role;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Set;

@Getter @Setter
@NoArgsConstructor @AllArgsConstructor
public class UserResponse {
    private Long id;
    private String userName;
    private String email;
    private String fullName;
    private String phone;
    private String address;
    private Set<Role> roles;
}
