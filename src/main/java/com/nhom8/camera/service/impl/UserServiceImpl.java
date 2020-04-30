package com.nhom8.camera.service.impl;

import com.nhom8.camera.entity.Role;
import com.nhom8.camera.entity.User;
import com.nhom8.camera.model.request.CreateUserAdminRequest;
import com.nhom8.camera.model.request.OffsetBasedPageRequest;
import com.nhom8.camera.model.request.UpdateUserAdminRequest;
import com.nhom8.camera.model.request.UserRegisterRequest;
import com.nhom8.camera.model.response.UserResponse;
import com.nhom8.camera.repository.RoleRepository;
import com.nhom8.camera.repository.UserRepository;
import com.nhom8.camera.service.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class UserServiceImpl implements UserService {
    private UserRepository userRepository;
    private PasswordEncoder passwordEncoder;
    private RoleRepository roleRepository;

    @Autowired
    public UserServiceImpl(UserRepository userRepository, PasswordEncoder passwordEncoder, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.roleRepository = roleRepository;
    }

    @Override
    public void saveUser(UserRegisterRequest userRegisterRequest) {
        if (userRepository.findByUserName(userRegisterRequest.getUserName()) == null && userRepository.findUserByEmail(userRegisterRequest.getEmail()) == null) {
            {
                User user = new User();
                BeanUtils.copyProperties(userRegisterRequest, user);
                user.setPassword(passwordEncoder.encode(userRegisterRequest.getPassword()));
                Set<Role> roles = new HashSet<>();
                roles.add(roleRepository.findRoleByName("ROLE_USER"));
                user.setRoles(roles);
                userRepository.save(user);
            }
        }
    }

    @Override
    public UserResponse findUserById(Long id) {
        User user = userRepository.findUserById(id);
        UserResponse userResponse = new UserResponse();
        BeanUtils.copyProperties(user, userResponse);
        return userResponse;
    }

    @Override
    public void createUserAdmin(CreateUserAdminRequest createUserAdminRequest) {
        User user = new User();
        BeanUtils.copyProperties(createUserAdminRequest, user);
        Set<Role> roles = new HashSet<>();
        if (createUserAdminRequest.getIds() == null) {
            roles.add(roleRepository.findByName("ROLE_USER"));
        } else {
            for(Long id : createUserAdminRequest.getIds()) {
                Role role = roleRepository.findOneById(id);
                if(role != null)
                    roles.add(role);
            }
        }
        user.setRoles(roles);
        user.setPassword(passwordEncoder.encode(createUserAdminRequest.getPassword()));
        userRepository.save(user);
    }

    @Override
    public void updateUserAdmin(User user, UpdateUserAdminRequest updateUserAdminRequest, Long id) {
        BeanUtils.copyProperties(updateUserAdminRequest, user);
        Set<Role> roles = new HashSet<>();
        for (Role role : user.getRoles()) {
            role.getUsers().remove(user);
        }
        if (updateUserAdminRequest.getIds() == null) {
            roles.add(roleRepository.findByName("ROLE_USER"));
        } else {
            for(Long idRole : updateUserAdminRequest.getIds()) {
                Role role = roleRepository.findOneById(idRole);
                if(role != null)
                    roles.add(role);
            }
        }
        user.setRoles(roles);
        user.setPassword(passwordEncoder.encode(updateUserAdminRequest.getPassword()));
        userRepository.save(user);
    }

    @Override
    public void deleteUserAdmin(Long id) {
            User user = userRepository.findUserById(id);
            userRepository.delete(user);
    }

    @Override
    public boolean userNameValid(String username) {
        return (userRepository.findByUserName(username) == null);
    }

    @Override
    public boolean emailValid(String email) {
        return (userRepository.findByEmail(email) == null);
    }

    @Override
    public List<User> getUserAndSort(String userName, int limit, int offset) {
        OffsetBasedPageRequest pageable = new OffsetBasedPageRequest(offset, limit, Sort.by("id").ascending());
        return userRepository.findUserList(userName, pageable);
    }
}