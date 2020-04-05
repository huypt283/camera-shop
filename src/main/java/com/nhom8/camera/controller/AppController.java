package com.nhom8.camera.controller;

import com.nhom8.camera.entity.ProductBranch;
import com.nhom8.camera.entity.User;
import com.nhom8.camera.model.request.ChangePasswordRequest;
import com.nhom8.camera.model.response.UserResponse;
import com.nhom8.camera.repository.UserRepository;
import com.nhom8.camera.security.CustomUserDetails;
import com.nhom8.camera.service.ProductBranchService;
import com.nhom8.camera.service.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

@Controller
public class AppController {
    private ProductBranchService productBranchService;
    private UserService userService;
    private UserRepository userRepository;
    private PasswordEncoder passwordEncoder;

    @Autowired
    public AppController(ProductBranchService productBranchService, UserService userService, UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.productBranchService = productBranchService;
        this.userService = userService;
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping(value = {"/", "/index"})
    public String index() {
        return "redirect:/home";
    }

    @GetMapping("/login")
    public ModelAndView login() {
        List<ProductBranch> lstProductBranch = productBranchService.getListProductBranch();
        ModelAndView mav = new ModelAndView("/login");
        mav.addObject("lstProductBranch", lstProductBranch);
        return mav;
    }

    @GetMapping("/info")
    public String webInfo(ModelMap modelMap) {
        List<ProductBranch> lstProductBranch = productBranchService.getListProductBranch();
        modelMap.addAttribute("lstProductBranch", lstProductBranch);
        return "/web/info";
    }

    @GetMapping("/contact")
    public String contact(ModelMap modelMap) {
        List<ProductBranch> lstProductBranch = productBranchService.getListProductBranch();
        modelMap.addAttribute("lstProductBranch", lstProductBranch);
        return "web/contact";
    }

    @GetMapping("/change-password")
    public ModelAndView changePasswordGet(@ModelAttribute(value = "changepassword") ChangePasswordRequest changePasswordRequest, @AuthenticationPrincipal CustomUserDetails userDetails) {
        ModelAndView mav = new ModelAndView("/change");
        UserResponse user = userService.findUserById(userDetails.getId());
        mav.addObject("user", user);
        return mav;
    }

    @PostMapping("/change-password")
    public String changePasswordPost(@Valid @ModelAttribute(value = "changepassword") ChangePasswordRequest changePasswordRequest, BindingResult result, ModelMap modelMap, @AuthenticationPrincipal CustomUserDetails userDetails) {
        User user = userRepository.findUserById(userDetails.getId());
        UserResponse userResponse = new UserResponse();
        BeanUtils.copyProperties(user, userResponse);
        if(result.hasErrors()) {
            modelMap.addAttribute("user", userResponse);
            return "/change";
        }
        if(user.getPassword().matches(changePasswordRequest.getOldPassword())) {
            user.setPassword(passwordEncoder.encode(changePasswordRequest.getPassword()));
            userRepository.save(user);
        }
        else {
            result.addError(new FieldError("changePasswordRequest", "oldPassword", "Old password wrong"));
            modelMap.addAttribute("user", userResponse);
            return "/change";
        }
        return "redirect:/login";
    }
}
