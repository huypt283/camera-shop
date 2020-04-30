package com.nhom8.camera.service;

import com.nhom8.camera.entity.User;
import com.nhom8.camera.model.request.CreateUserAdminRequest;
import com.nhom8.camera.model.request.UpdateUserAdminRequest;
import com.nhom8.camera.model.request.UserRegisterRequest;
import com.nhom8.camera.model.response.UserResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface UserService {
    void saveUser(UserRegisterRequest userRegisterRequest);
    UserResponse findUserById(Long id);
    void createUserAdmin(CreateUserAdminRequest createUserAdminRequest);
    void updateUserAdmin(User user, UpdateUserAdminRequest updateUserAdminRequest, Long id);
    void deleteUserAdmin(Long id);
    boolean userNameValid(String username);
    boolean emailValid(String email);
    List<User> getUserAndSort(String userName ,int limit, int offset);
}
