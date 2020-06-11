package com.nhom8.camera.controller.admin;

import com.nhom8.camera.entity.Product;
import com.nhom8.camera.entity.ProductBrand;
import com.nhom8.camera.model.request.CreateProductRequest;
import com.nhom8.camera.model.request.UpdateProductRequest;
import com.nhom8.camera.repository.BrandRepository;
import com.nhom8.camera.repository.ProductRepository;
import com.nhom8.camera.security.CustomUserDetails;
import com.nhom8.camera.service.ProductService;
import com.nhom8.camera.util.GenerateSlug;
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
    private final int limit = 10;

    private ProductRepository productRepository;
    private BrandRepository brandRepository;
    private ProductService productService;

    @Autowired
    public ProductManageController(ProductRepository productRepository, BrandRepository brandRepository, ProductService productService) {
        this.productRepository = productRepository;
        this.brandRepository = brandRepository;
        this.productService = productService;
    }

    @GetMapping("/list-product")
    public ModelAndView listProduct(@RequestParam(value = "page", defaultValue = "1") int page) {
        ModelAndView mav = new ModelAndView("/admin/product-table");
        int offset = (page-1)*limit;
        List<Product> products = productService.getListProduct(limit, offset);
        long totalPage = productRepository.count()/limit + 1;
        mav.addObject("totalPage", totalPage);
        mav.addObject("products", products);
        return mav;
    }

    @GetMapping("/product")
    public ModelAndView createProductGet(@ModelAttribute(value = "productRequest") CreateProductRequest createProductRequest) {
        ModelAndView mav = new ModelAndView("/admin/product-create");
        List<ProductBrand> branches = brandRepository.findAll();
        mav.addObject("branches", branches);
        return mav;
    }

    @PostMapping("/product")
    public String createProductPost(@Valid @ModelAttribute(value = "productRequest") CreateProductRequest createProductRequest, BindingResult result, HttpServletRequest request, @AuthenticationPrincipal CustomUserDetails userDetails, ModelMap modelMap) {
        if(result.hasErrors()) {
            List<ProductBrand> branches = brandRepository.findAll();
            modelMap.addAttribute("branches", branches);
            return "/admin/product-create";
        }
        final String uploadRootPath = request.getServletContext().getRealPath("template/upload");
        MultipartFile fileData = createProductRequest.getProductImage();
        String productImage = null;
        if(!fileData.isEmpty()) {
            String fileName = GenerateSlug.makeSlug(createProductRequest.getName()) + ".jpg";
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
    public ModelAndView productUpdateGet(@PathVariable(value = "id") final Long id, @ModelAttribute(value = "productRequest") UpdateProductRequest updateProductRequest, @RequestParam(value = "page", defaultValue = "1") int page) {
        ModelAndView mav = new ModelAndView("/admin/product-update");
        List<ProductBrand> branches = brandRepository.findAll();
        mav.addObject("branches", branches);
        Product product = productService.getSingleProductById(id);
        if (product != null) {
            mav.addObject("product", product);
            return mav;
        }
        return listProduct(page);
    }

    @PostMapping("/product/{id}")
    public String productUpdatePost(@PathVariable(value = "id") final Long id, @Valid @ModelAttribute(value = "productRequest") UpdateProductRequest updateProductRequest, BindingResult result, HttpServletRequest request, @AuthenticationPrincipal CustomUserDetails userDetails, ModelMap modelMap) {
        Product product = productService.getSingleProductById(id);
        String name = updateProductRequest.getName();
        if(!name.equals(product.getName()) && !productService.productNameValid(name)) {
            result.addError(new FieldError("updateProductRequest", "name", "Product name already exist or not same old product name"));
        }
        if(result.hasErrors()) {
            List<ProductBrand> branches = brandRepository.findAll();
            modelMap.addAttribute("branches", branches);
            modelMap.addAttribute("product", product);
            return "/admin/product-update";
        }

        final String uploadRootPath = request.getServletContext().getRealPath("template/upload");
        MultipartFile fileData = updateProductRequest.getProductImage();
        String productImage = null;
        String oldProductImage = product.getProductImage();
        if(!fileData.isEmpty()) {
            if(oldProductImage != null) {
                try {
                    final String deleteRootPath = request.getServletContext().getRealPath(oldProductImage);
                    Files.deleteIfExists(Paths.get(deleteRootPath));
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            String fileName = GenerateSlug.makeSlug(updateProductRequest.getName()) + ".jpg";
            productImage = "/template/upload/" + fileName;
            try {
                File serverFile = new File(uploadRootPath + File.separator + fileName);
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                stream.write(fileData.getBytes());
                stream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else
            productImage = oldProductImage;
        productService.updateProduct(product, updateProductRequest, productImage, userDetails.getUsername(), id);
        return "redirect:/admin/list-product";
    }

    @GetMapping("product-delete/{id}")
    public String deleteProduct(@PathVariable Long id, HttpServletRequest request, ModelMap modelMap) {
        Product product = productService.getSingleProductById(id);
        String oldProductImage = product.getProductImage();
        if (productService.deleteProduct(product)) {
            if(oldProductImage != null) {
                try {
                    final String deleteRootPath = request.getServletContext().getRealPath(oldProductImage);
                    Files.deleteIfExists(Paths.get(deleteRootPath));
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            return "redirect:/admin/list-product";
        } else {
            modelMap.addAttribute("message", "Sản phẩm đã tồn tại trong hóa đơn, không thể xóa");
            return "admin/direct-message";
        }
    }
}
