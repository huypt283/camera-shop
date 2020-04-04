package com.nhom8.camera.controller.web;

import com.nhom8.camera.entity.ProductBranch;
import com.nhom8.camera.service.ProductBranchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class ProductBranchController {
    private ProductBranchService productBranchService;
    @Autowired
    public ProductBranchController(ProductBranchService productBranchService){this.productBranchService=productBranchService;}

    @GetMapping
    public ModelAndView getListProductBranch(@RequestParam(value = "limit", defaultValue = "20", required = false) int limit,
                                             @RequestParam(value = "offset", defaultValue = "0", required = false) int offset)
    {
        List<ProductBranch> lstProductBranch = productBranchService.getListProductBranch();
        ModelAndView mav = new ModelAndView("/web/header");
        mav.addObject("lstProductBranch", lstProductBranch);
        return mav;
    }
}
