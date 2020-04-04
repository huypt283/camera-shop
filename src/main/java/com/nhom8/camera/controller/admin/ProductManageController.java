package com.nhom8.camera.controller.admin;

import com.nhom8.camera.entity.Product;
import com.nhom8.camera.entity.ProductBranch;
import com.nhom8.camera.model.request.CreateProductRequest;
import com.nhom8.camera.model.request.UpdateProductRequest;
import com.nhom8.camera.repository.BranchRepository;
import com.nhom8.camera.repository.ProductRepository;
import com.nhom8.camera.security.CustomUserDetails;
import com.nhom8.camera.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class ProductManageController {
    private ProductRepository productRepository;
    private BranchRepository branchRepository;
    private ProductService productService;

    @Autowired
    public ProductManageController(ProductRepository productRepository, BranchRepository branchRepository, ProductService productService) {
        this.productRepository = productRepository;
        this.branchRepository = branchRepository;
        this.productService = productService;
    }

    @GetMapping("/list-product")
    public ModelAndView listProduct() {
        ModelAndView mav = new ModelAndView("/admin/product-table");
        List<Product> products = productRepository.findAll();
        mav.addObject("products", products);
        return mav;
    }

    @GetMapping("/product")
    public ModelAndView createProductGet(@ModelAttribute(value = "productRequest") CreateProductRequest createProductRequest) {
        ModelAndView mav = new ModelAndView("/admin/product-create");
        List<ProductBranch> branches = branchRepository.findAll();
        mav.addObject("branches", branches);
        return mav;
    }

    @PostMapping("/product")
    public String createProductPost(@Valid @ModelAttribute(value = "productRequest") CreateProductRequest createProductRequest, BindingResult result, HttpServletRequest request, @AuthenticationPrincipal CustomUserDetails userDetails, ModelMap modelMap) {
        if(result.hasErrors()) {
            List<ProductBranch> branches = branchRepository.findAll();
            modelMap.addAttribute("branches", branches);
            return "/admin/product-create";
        }
        final String uploadRootPath = request.getServletContext().getRealPath("template/upload");
        MultipartFile fileData = createProductRequest.getProductImage();
        String productImage = null;
        if(!fileData.isEmpty()) {
            String fileName = createProductRequest.getName() + "." + fileData.getOriginalFilename().split("\\.")[1];
            productImage = "/template/upload/" + fileName;
            try {
                File serverFile = new File(uploadRootPath + File.separator + fileName);
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                stream.write(fileData.getBytes());
                stream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        productService.createProduct(createProductRequest, productImage, userDetails.getUsername());
        return "redirect:/admin/list-product";
    }

    @GetMapping("/product/{id}")
    public ModelAndView productUpdateGet(@PathVariable(value = "id") final Long id, @ModelAttribute(value = "productRequest") UpdateProductRequest updateProductRequest) {
        ModelAndView mav = new ModelAndView("/admin/product-update");
        List<ProductBranch> branches = branchRepository.findAll();
        mav.addObject("branches", branches);
        Product product = productService.getSingleProductById(id);
        if (product != null) {
            mav.addObject("product", product);
            return mav;
        }
        return listProduct();
    }

    @PostMapping("/product/{id}")
    public ModelAndView productUpdatePost(@PathVariable(value = "id") final Long id, @Valid @ModelAttribute(value = "productRequest") UpdateProductRequest updateProductRequest, BindingResult result, HttpServletRequest request, @AuthenticationPrincipal CustomUserDetails userDetails) {
        Product product = productService.getSingleProductById(id);
        String name = updateProductRequest.getName();
        if(!name.equals(product.getName()) && !productService.productNameValid(name)) {
            result.addError(new FieldError("updateProductRequest", "name", "Product name already exist or not same old product name"));
        }
        if(result.hasErrors()) {
            ModelAndView mav = new ModelAndView("/admin/product-update");
            List<ProductBranch> branches = branchRepository.findAll();
            mav.addObject("branches", branches);
            mav.addObject("product", product);
            return mav;
        }
        String oldProductImage = product.getProductImage();
        if(oldProductImage != null) {
            try {
                final String deleteRootPath = request.getServletContext().getRealPath(oldProductImage);
                Files.deleteIfExists(Paths.get(deleteRootPath));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        final String uploadRootPath = request.getServletContext().getRealPath("template/upload");
        MultipartFile fileData = updateProductRequest.getProductImage();
        String productImage = null;
        if(!fileData.isEmpty()) {
            String fileName = updateProductRequest.getName() + "." + fileData.getOriginalFilename().split("\\.")[1];
            productImage = "/template/upload/" + fileName;
            try {
                File serverFile = new File(uploadRootPath + File.separator + fileName);
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                stream.write(fileData.getBytes());
                stream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        productService.updateProduct(product, updateProductRequest, productImage, userDetails.getUsername(), id);
        return listProduct();
    }

    @GetMapping("product-delete/{id}")
    public String deleteProduct(@PathVariable Long id, HttpServletRequest request) {
        Product product = productService.getSingleProductById(id);
        String oldProductImage = product.getProductImage();
        if(oldProductImage != null) {
            try {
                final String deleteRootPath = request.getServletContext().getRealPath(oldProductImage);
                Files.deleteIfExists(Paths.get(deleteRootPath));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        productService.deleteProduct(product);
        return "redirect:/admin/list-product";
    }
}
