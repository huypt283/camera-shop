package com.nhom8.camera.controller;

import com.nhom8.camera.entity.ProductBrand;
import com.nhom8.camera.entity.User;
import com.nhom8.camera.model.request.ChangePasswordRequest;
import com.nhom8.camera.model.request.ChangeProfileRequest;
import com.nhom8.camera.model.response.UserResponse;
import com.nhom8.camera.repository.UserRepository;
import com.nhom8.camera.security.CustomUserDetails;
import com.nhom8.camera.service.ProductBrandService;
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
import java.util.List;
import java.util.Set;
import java.util.function.Predicate;

@Controller
public class ProfileController {
    private UserService userService;
    private ProductBrandService productBrandService;
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
        List<ProductBrand> lstProductBrands = productBrandService.getListProductBrand();
        ModelAndView mav = new ModelAndView("profile-change");
        UserResponse user = userService.findUserById(userDetails.getId());
        mav.addObject("user", user);
        mav.addObject("lstProductBrand", lstProductBrands);
        mav.addObject("message", "Nhập vào thông tin để thay đổi thông tin cá nhân");
        return mav;
    }

    @PostMapping("edit-profile")
    public String editProfilePost(@Valid @ModelAttribute(value = "changeProfile") ChangeProfileRequest changeProfileRequest, BindingResult result, ModelMap modelMap, @AuthenticationPrincipal CustomUserDetails userDetails) {
        User user = userRepository.findUserById(userDetails.getId());
        UserResponse userResponse = new UserResponse();
        BeanUtils.copyProperties(user, userResponse);
        List<ProductBrand> lstProductBrands = productBrandService.getListProductBrand();
        modelMap.addAttribute("lstProductBrand", lstProductBrands);
        if (!passwordEncoder.matches(changeProfileRequest.getCurrentPassword(), user.getPassword())) {
            result.addError(new FieldError("changeProfileRequest", "currentPassword", "Password wrong"));
        }

        String email = changeProfileRequest.getEmail();
        if (!email.equals(user.getEmail()) && !userService.emailValid(email)) {
            result.addError(new FieldError("changeProfileRequest", "email", "Email already exist or not same old email"));
        }

        if (result.hasErrors()) {
            modelMap.addAttribute("user", userResponse);
            modelMap.addAttribute("message", "Dữ liệu nhập vào chưa đúng, mời bạn nhập lại");
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
        List<ProductBrand> lstProductBrands = productBrandService.getListProductBrand();
        ModelAndView mav = new ModelAndView("password-change");
        UserResponse user = userService.findUserById(userDetails.getId());
        mav.addObject("user", user);
        mav.addObject("lstProductBrand", lstProductBrands);
        mav.addObject("message", "Nhập vào thông tin để đổi mật khẩu");
        return mav;
    }

    @PostMapping("/change-password")
    public String changePasswordPost(@Valid @ModelAttribute(value = "changepassword") ChangePasswordRequest changePasswordRequest, BindingResult result, ModelMap modelMap, @AuthenticationPrincipal CustomUserDetails userDetails) {
        User user = userRepository.findUserById(userDetails.getId());
        UserResponse userResponse = new UserResponse();
        BeanUtils.copyProperties(user, userResponse);
        List<ProductBrand> lstProductBrands = productBrandService.getListProductBrand();
        modelMap.addAttribute("lstProductBrand", lstProductBrands);
        if(!changePasswordRequest.getPassword().equals(changePasswordRequest.getConfirmPassword()))
            result.addError(new FieldError("changePasswordRequest", "confirmPassword", "Confirm password not match"));

        if (!passwordEncoder.matches(changePasswordRequest.getOldPassword(), user.getPassword()))
            result.addError(new FieldError("changePasswordRequest", "oldPassword", "Old password wrong"));

        if (result.hasErrors()) {
            modelMap.addAttribute("user", userResponse);
            modelMap.addAttribute("message", "Dữ liệu nhập vào chưa đúng, mời bạn nhập lại");
            return "password-change";
        } else {
            user.setPassword(passwordEncoder.encode(changePasswordRequest.getPassword()));
            userRepository.save(user);
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
