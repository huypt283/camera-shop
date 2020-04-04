package com.nhom8.camera.controller.web;

import com.nhom8.camera.entity.Product;
import com.nhom8.camera.entity.ProductBranch;
import com.nhom8.camera.model.response.PageResponse;
import com.nhom8.camera.service.ProductBranchService;
import com.nhom8.camera.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {
    private ProductService productService;
    private ProductBranchService productBranchService;
    private final int limit=2;

    @Autowired
    public ProductController(ProductService productService, ProductBranchService productBranchService1) {
        this.productService = productService;
        this.productBranchService=productBranchService1;
    }

    @GetMapping
    public ModelAndView getListProduct(@RequestParam(value = "page_product", defaultValue = "1", required = false) int page_product) {
        PageResponse pageResponse1= new PageResponse();
        final int offset = (page_product-1)*limit;
        List<Product> products = productService.getListProduct(limit, offset);
        pageResponse1.setPage(page_product);
        pageResponse1.setLimit(limit);
        pageResponse1.setProductList(products);
        pageResponse1.setTotalItem(productService.getCount());
        pageResponse1.setTotalPage((int) Math.ceil((double) pageResponse1.getTotalItem()/pageResponse1.getLimit() ));
        pageResponse1.setUrl("/product");
        List<ProductBranch> lstProductBranch = productBranchService.getListProductBranch();
        ModelAndView mav = new ModelAndView("/web/product");
        mav.addObject("models1", pageResponse1);
        mav.addObject("lstProductBranch", lstProductBranch);
        return mav;
    }

//    @GetMapping
    public List<ProductBranch> getListBranch(@RequestParam(value = "limit", defaultValue = "20", required = false) int limit,
                                      @RequestParam(value = "offset", defaultValue = "0", required = false) int offset)
    {
        List<ProductBranch> lstBranch= productBranchService.getListProductBranch();
        return lstBranch;
    }
//    @RequestMapping(path = "/{id}", method = RequestMethod.GET)
    @GetMapping("/{id}")
    public ModelAndView getSingleProduct(@PathVariable(name = "id") Long id) {
        ModelAndView mav = new ModelAndView("/web/single");
        List<ProductBranch> lstBranch = productBranchService.getListProductBranch();

        Product product = productService.getSingleProductById(id);
        mav.addObject("product", product);
        mav.addObject("lstBranch", lstBranch);

        return mav;
    }
    @GetMapping("/branchId={id}")
    public ModelAndView getListProductByBranchId(@PathVariable(name = "id") Long id,
                                                 @RequestParam(value = "page_product", defaultValue = "1", required = false) int page_product,
                                                 HttpRequest request)
    {

        PageResponse pageResponse1 = new PageResponse();
        final int offset = (page_product-1)*limit;
        List<Product> products = productService.getListProductByBranhId(id,limit,offset);
        pageResponse1.setPage(page_product);
        pageResponse1.setLimit(limit);
        pageResponse1.setProductList(products);
        pageResponse1.setTotalItem(productService.getCount());
        pageResponse1.setTotalPage((int) Math.ceil((double) pageResponse1.getTotalItem()/pageResponse1.getLimit() ));
        pageResponse1.setUrl("/product/branchId={"+id+"}");
        List<ProductBranch> lstProductBranch = productBranchService.getListProductBranch();
        ModelAndView mav = new ModelAndView("/web/product");
        mav.addObject("models1", pageResponse1);
        mav.addObject("lstProductBranch", lstProductBranch);
        return mav;
    }
}
