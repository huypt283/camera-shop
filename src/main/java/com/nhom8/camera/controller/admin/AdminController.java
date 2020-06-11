package com.nhom8.camera.controller.admin;

import com.nhom8.camera.model.response.UserResponse;
import com.nhom8.camera.security.CustomUserDetails;
import com.nhom8.camera.service.UserService;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
    private UserService userService;

    public AdminController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping(value = {"/home" , "/" , ""})
    public String home(@AuthenticationPrincipal CustomUserDetails customUserDetails, ModelMap modelMap) {
        UserResponse user = userService.findUserById(customUserDetails.getId());
        modelMap.addAttribute("user", user);
        return "/admin/home";
    }
}
