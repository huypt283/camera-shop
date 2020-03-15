package com.nhom8.camera.controller.web;

import com.nhom8.camera.entity.Product;
import com.nhom8.camera.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/sell_cameras/home")
public class HomeController {
    private ProductService productService;
    @Autowired
    public HomeController(ProductService productService){this.productService=productService;}
    @GetMapping
    public ModelAndView getListProduct(@RequestParam(value = "limit", defaultValue = "20", required = false) int limit,
                                       @RequestParam(value = "offset", defaultValue = "0", required = false) int offset) {
        List<Product> products = productService.getListProduct(limit, offset);
        ModelAndView mav = new ModelAndView("/web/index");
        mav.addObject("products", products);
        return mav;
    }
}
