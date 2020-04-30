package com.nhom8.camera.controller.admin;

import com.nhom8.camera.entity.Role;
import com.nhom8.camera.entity.User;
import com.nhom8.camera.model.request.CreateUserAdminRequest;
import com.nhom8.camera.model.request.UpdateUserAdminRequest;
import com.nhom8.camera.model.response.UserResponse;
import com.nhom8.camera.repository.RoleRepository;
import com.nhom8.camera.repository.UserRepository;
import com.nhom8.camera.security.CustomUserDetails;
import com.nhom8.camera.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class UserManageController {
    private final int limit = 10;

    private UserService userService;
    private UserRepository userRepository;
    private RoleRepository roleRepository;

    @Autowired
    public UserManageController(UserService userService, UserRepository userRepository, RoleRepository roleRepository) {
        this.userService = userService;
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    @GetMapping("/list-user")
    public ModelAndView listUser(@RequestParam(value = "page", defaultValue = "1") int page, @AuthenticationPrincipal CustomUserDetails userDetails) {
        ModelAndView mav = new ModelAndView("/admin/user-table");
        int offset = (page-1)*limit;
        List<User> users = userService.getUserAndSort(userDetails.getUsername(), limit, offset);
        long totalPage = userRepository.count()/limit + 1;
        mav.addObject("totalPage", totalPage);
        mav.addObject("users", users);
        return mav;
    }

    @GetMapping("/user")
    public ModelAndView createUserGet(@ModelAttribute(value = "userRequest") CreateUserAdminRequest createUserAdminRequest) {
        ModelAndView mav = new ModelAndView("/admin/user-create");
        List<Role> roles = roleRepository.findAll();
        mav.addObject("roles", roles);
        return mav;
    }

    @PostMapping("/user")
    public String createUserPost(@Valid @ModelAttribute(value = "userRequest") CreateUserAdminRequest createUserAdminRequest, BindingResult result) {
        if(result.hasErrors()) {
            return "/admin/user-create";
        }
        userService.createUserAdmin(createUserAdminRequest);
        return "redirect:/admin/list-user";
    }

    @GetMapping("/user/{id}")
    public String updateUserGet(@PathVariable(value = "id") final Long id, @ModelAttribute(value = "userRequest") UpdateUserAdminRequest updateUserAdminRequest, @RequestParam(value = "page", defaultValue = "1") int page, ModelMap modelMap, @AuthenticationPrincipal CustomUserDetails userDetails) {
        if (!id.equals(userDetails.getId())) {
            List<Role> roles = roleRepository.findAll();
            UserResponse user = userService.findUserById(id);
            modelMap.addAttribute("roles", roles);
            modelMap.addAttribute("user", user);
            return "/admin/user-update";
        }
        return "redirect:/admin/error";
    }

    @PostMapping("/user/{id}")
    public String updateUserPost(@PathVariable(value = "id") final Long id, @Valid @ModelAttribute(value = "userRequest") UpdateUserAdminRequest updateUserAdminRequest, BindingResult result, ModelMap modelMap, @AuthenticationPrincipal CustomUserDetails userDetails) {
        if (!id.equals(userDetails.getId())) {
            User user = userRepository.findUserById(id);
            String email = updateUserAdminRequest.getEmail();
            if(!email.equals(user.getEmail()) && !userService.emailValid(email)) {
                result.addError(new FieldError("updateUserAdminRequest", "email", "Email already exist or not same old email"));
            }
            if(result.hasErrors()) {
                List<Role> roles = roleRepository.findAll();
                UserResponse userResponse = userService.findUserById(id);
                modelMap.addAttribute("roles", roles);
                modelMap.addAttribute("user", userResponse);
                return "/admin/user-update";
            }
            userService.updateUserAdmin(user, updateUserAdminRequest, id);
            return "redirect:/admin/list-user";
        }
        return "redirect:/admin/error";
    }

    @GetMapping("/user-delete/{id}")
    public String deleteUser(@PathVariable Long id, @AuthenticationPrincipal CustomUserDetails userDetails) {
        if (!id.equals(userDetails.getId())) {
            userService.deleteUserAdmin(id);
            return "redirect:/admin/list-user";
        }
        return "redirect:/admin/error";
    }
}
