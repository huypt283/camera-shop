package com.nhom8.camera.controller;

import com.nhom8.camera.entity.User;
import com.nhom8.camera.model.request.ChangePasswordRequest;
import com.nhom8.camera.model.request.ChangeProfileRequest;
import com.nhom8.camera.model.response.UserResponse;
import com.nhom8.camera.repository.UserRepository;
import com.nhom8.camera.security.CustomUserDetails;
import com.nhom8.camera.service.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.HashSet;
import java.util.Set;
import java.util.function.Predicate;

@Controller
public class ProfileController {
    private UserService userService;
    private UserRepository userRepository;
    private PasswordEncoder passwordEncoder;

    @Autowired
    public ProfileController(UserService userService, UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("edit-profile")
    public ModelAndView editProfileGet(@ModelAttribute(value = "changeProfile") ChangeProfileRequest changeProfileRequest, @AuthenticationPrincipal CustomUserDetails userDetails) {
        ModelAndView mav = new ModelAndView("profile-change");
        UserResponse user = userService.findUserById(userDetails.getId());
        mav.addObject("user", user);
        return mav;
    }

    @PostMapping("edit-profile")
    public String editProfilePost(@Valid @ModelAttribute(value = "changeProfile") ChangeProfileRequest changeProfileRequest, BindingResult result, ModelMap modelMap, @AuthenticationPrincipal CustomUserDetails userDetails) {
        User user = userRepository.findUserById(userDetails.getId());
        UserResponse userResponse = new UserResponse();
        BeanUtils.copyProperties(user, userResponse);
        if (!passwordEncoder.matches(changeProfileRequest.getCurrentPassword(), user.getPassword())) {
            result.addError(new FieldError("changeProfileRequest", "password", "Password wrong"));
        }
        if (result.hasErrors()) {
            modelMap.addAttribute("user", userResponse);
            return "profile-change";
        }

        String email = changeProfileRequest.getEmail();
        if (!email.equals(user.getEmail()) && !userService.emailValid(email)) {
            result.addError(new FieldError("changeProfileRequest", "email", "Email already exist or not same old email"));
            modelMap.addAttribute("user", userResponse);
            return "profile-change";
        } else {
            BeanUtils.copyProperties(changeProfileRequest, user);
            userRepository.save(user);
        }

        modelMap.addAttribute("message", "Đổi thông tin cá nhân thành công");

        Set<GrantedAuthority> grantedAuthorities = new HashSet<>(userDetails
                .getAuthorities());

        if (isAdmin(grantedAuthorities)) {
            return "/admin/direct-message";
        } else {
            return "/web/direct-message";
        }
    }

    @GetMapping("/change-password")
    public ModelAndView changePasswordGet(@ModelAttribute(value = "changePassword") ChangePasswordRequest changePasswordRequest, @AuthenticationPrincipal CustomUserDetails userDetails) {
        ModelAndView mav = new ModelAndView("password-change");
        UserResponse user = userService.findUserById(userDetails.getId());
        mav.addObject("user", user);
        return mav;
    }

    @PostMapping("/change-password")
    public String changePasswordPost(@Valid @ModelAttribute(value = "changepassword") ChangePasswordRequest changePasswordRequest, BindingResult result, ModelMap modelMap, @AuthenticationPrincipal CustomUserDetails userDetails) {
        User user = userRepository.findUserById(userDetails.getId());
        UserResponse userResponse = new UserResponse();
        BeanUtils.copyProperties(user, userResponse);
        if (result.hasErrors()) {
            modelMap.addAttribute("user", userResponse);
            return "password-change";
        }
        if (passwordEncoder.matches(changePasswordRequest.getOldPassword(), user.getPassword())) {
            user.setPassword(passwordEncoder.encode(changePasswordRequest.getPassword()));
            userRepository.save(user);
        } else {
            result.addError(new FieldError("changePasswordRequest", "oldPassword", "Old password wrong"));
            modelMap.addAttribute("user", userResponse);
            return "password-change";
        }
        modelMap.addAttribute("message", "Đổi mật khẩu thành công");

        Set<GrantedAuthority> grantedAuthorities = new HashSet<>(userDetails
                .getAuthorities());

        if (isAdmin(grantedAuthorities)) {
            return "/admin/direct-message";
        } else {
            return "/web/direct-message";
        }
    }

    private boolean isAdmin(Set<GrantedAuthority> grantedAuthorities) {
        Predicate<GrantedAuthority> compare = s -> s.getAuthority().equals("ROLE_ADMIN");
        return grantedAuthorities.stream().anyMatch(compare);
    }
}
