package com.nhom8.camera.controller.web;

import com.nhom8.camera.entity.Product;
import com.nhom8.camera.entity.ProductBrand;
import com.nhom8.camera.model.response.PageResponse;
import com.nhom8.camera.service.ProductBranchService;
import com.nhom8.camera.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/home")
public class HomeController {
    private ProductService productService;
    private ProductBranchService productBranchService;
    private final int limit = 10;

    @Autowired
    public HomeController(ProductService productService, ProductBranchService productBranchService) {
        this.productService = productService;
        this.productBranchService = productBranchService;
    }

    @GetMapping
    public ModelAndView getListProduct(@RequestParam(value = "page", defaultValue = "1", required = false) int page) {
        PageResponse pageResponse= new PageResponse();
        final int offset = (page-1)*limit;
        List<Product> products = productService.getListProduct(limit, offset);
        pageResponse.setPage(page);
        pageResponse.setLimit(limit);
        pageResponse.setProductList(products);
        pageResponse.setTotalItem(productService.getCount());
        pageResponse.setTotalPage((int) Math.ceil((double) pageResponse.getTotalItem()/pageResponse.getLimit() ));
        List<ProductBrand> lstProductBrands = productBranchService.getListProductBranch();
        ModelAndView mav = new ModelAndView("/web/index");
        mav.addObject("models", pageResponse);
        mav.addObject("lstProductBranch", lstProductBrands);
        return mav;
    }
}
