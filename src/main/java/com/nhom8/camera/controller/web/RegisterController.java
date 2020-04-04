package com.nhom8.camera.controller.web;

import com.nhom8.camera.model.request.UserRegisterRequest;
import com.nhom8.camera.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/register")
public class RegisterController {
    private UserService userService;

    @Autowired
    public RegisterController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping
    public ModelAndView register() {
        ModelAndView mav = new ModelAndView();
        UserRegisterRequest userRegisterRequest = new UserRegisterRequest();
        mav.addObject("userRegister", userRegisterRequest);
        mav.setViewName("web/register");
        return mav;
    }

    @PostMapping
    public String register(@ModelAttribute("userRegister") UserRegisterRequest userRegisterRequest, ModelMap modelMap) {

        userService.saveUser(userRegisterRequest);
//        System.out.println("iUserService.saveUser(userRequest)");
        modelMap.addAttribute("messenger", "Dang ky thanh cong");
        return "redirect:/login";
    }
}
