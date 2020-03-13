package com.nhom8.camera.controller.web;

import com.nhom8.camera.entity.Product;
import com.nhom8.camera.model.response.ProductResponse;
import com.nhom8.camera.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {
    private ProductService productService;

    @Autowired
    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping
    public ModelAndView getListProduct(@RequestParam(value = "limit", defaultValue = "20", required = false) int limit,
                                       @RequestParam(value = "offset", defaultValue = "0", required = false) int offset) {
        List<Product> products = productService.getListProduct(limit, offset);
        ModelAndView mav = new ModelAndView("/web/product");
        mav.addObject("products", products);
        return mav;
    }


//    @RequestMapping(path = "/{id}", method = RequestMethod.GET)
    @GetMapping("/{id}")
    public ModelAndView getSingleProduct(@PathVariable(name = "id") Long id) {
        ModelAndView mav = new ModelAndView("/web/single");


        Product product = productService.getSingleProductById(id);
        mav.addObject("product", product);

        return mav;
    }

}
