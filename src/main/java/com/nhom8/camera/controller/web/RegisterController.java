package com.nhom8.camera.controller.web;

import com.nhom8.camera.entity.ProductBranch;
import com.nhom8.camera.model.request.UserRegisterRequest;
import com.nhom8.camera.service.ProductBranchService;
import com.nhom8.camera.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/register")
public class RegisterController {
    private UserService userService;
    private ProductBranchService productBranchService;

    @Autowired
    public RegisterController(UserService userService, ProductBranchService productBranchService) {
        this.userService = userService;
        this.productBranchService = productBranchService;
    }

    @GetMapping
    public ModelAndView register(@ModelAttribute("userRegister") UserRegisterRequest userRegisterRequest) {
        ModelAndView mav = new ModelAndView("web/register");
        List<ProductBranch> lstProductBranch = productBranchService.getListProductBranch();
        mav.addObject("lstProductBranch", lstProductBranch);
        return mav;
    }

    @PostMapping
    public String register(@Valid @ModelAttribute("userRegister") UserRegisterRequest userRegisterRequest, BindingResult result, ModelMap modelMap) {
        if (result.hasErrors()) {
            List<ProductBranch> lstProductBranch = productBranchService.getListProductBranch();
            modelMap.addAttribute("lstProductBranch", lstProductBranch);
            return "web/register";
        }
        userService.saveUser(userRegisterRequest);
        modelMap.addAttribute("messenger", "Register success!");
        return "redirect:/login";
    }
}
