package com.nhom8.camera.controller.web;

import com.nhom8.camera.entity.Product;
import com.nhom8.camera.entity.ProductBranch;
import com.nhom8.camera.model.response.ProductResponse;
import com.nhom8.camera.service.ProductBranchService;
import com.nhom8.camera.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/sell_cameras/product")
public class ProductController {
    private ProductService productService;
    private ProductBranchService productBranchService;
//    private  ModelAndView mav = new ModelAndView("/web/product");
    @Autowired
    public ProductController(ProductService productService, ProductBranchService productBranchService1) {
        this.productService = productService;
        this.productBranchService=productBranchService1;
    }

    @GetMapping
    public ModelAndView getListProduct(@RequestParam(value = "limit", defaultValue = "20", required = false) int limit,
                                       @RequestParam(value = "offset", defaultValue = "0", required = false) int offset) {
        List<Product> products = productService.getListProduct(limit, offset);
        List<ProductBranch> lstBranch= getListBranch(limit, offset);
        ModelAndView mav = new ModelAndView("/web/product");
        mav.addObject("products", products);
        mav.addObject("lstBranch", lstBranch);
        return mav;
    }

//    @GetMapping
    public List<ProductBranch> getListBranch(@RequestParam(value = "limit", defaultValue = "20", required = false) int limit,
                                      @RequestParam(value = "offset", defaultValue = "0", required = false) int offset)
    {
        List<ProductBranch> lstBranch= productBranchService.getListProductBranch(limit, offset);
        return lstBranch;
    }
//    @RequestMapping(path = "/{id}", method = RequestMethod.GET)
    @GetMapping("/{id}")
    public ModelAndView getSingleProduct(@PathVariable(name = "id") Long id) {
        ModelAndView mav = new ModelAndView("/web/single");


        Product product = productService.getSingleProductById(id);
        mav.addObject("product", product);

        return mav;
    }
    @GetMapping("/branchId={id}")
    public ModelAndView getListProductByBranchId(@PathVariable(name = "id") Long id)
    {
        ModelAndView mav = new ModelAndView("/web/product");
        List<Product> products= productService.getListProductByBranhId(id);
        List<ProductBranch> lstBranch= getListBranch(20, 0);
        mav.addObject("products", products);
        mav.addObject("lstBranch", lstBranch);
        return mav;
    }
}
