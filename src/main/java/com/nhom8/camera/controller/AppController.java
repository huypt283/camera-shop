package com.nhom8.camera.controller;

import com.nhom8.camera.entity.ProductBranch;
import com.nhom8.camera.service.ProductBranchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class AppController {
    private ProductBranchService productBranchService;

    @Autowired
    public AppController(ProductBranchService productBranchService) {
        this.productBranchService = productBranchService;
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

    @GetMapping("/404")
    public String web404() {
        return "web/404";
    }

    @GetMapping("/contact")
    public String contact() {
        return "web/contact";
    }
}
