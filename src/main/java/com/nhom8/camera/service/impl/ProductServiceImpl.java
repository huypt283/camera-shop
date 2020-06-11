package com.nhom8.camera.service.impl;

import com.nhom8.camera.entity.Product;
import com.nhom8.camera.entity.ProductBrand;
import com.nhom8.camera.model.request.CreateProductRequest;
import com.nhom8.camera.model.request.OffsetBasedPageRequest;
import com.nhom8.camera.model.request.UpdateProductRequest;
import com.nhom8.camera.repository.BrandRepository;
import com.nhom8.camera.repository.ProductRepository;
import com.nhom8.camera.service.LineItemService;
import com.nhom8.camera.service.ProductService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    private ProductRepository productRepository;
    private BrandRepository brandRepository;
    private LineItemService lineItemService;

    @Autowired
    public ProductServiceImpl(ProductRepository productRepository, BrandRepository brandRepository, LineItemService lineItemService) {
        this.productRepository = productRepository;
        this.brandRepository = brandRepository;
        this.lineItemService = lineItemService;
    }

    @Override
    public Product getSingleProductById(Long id) {
        return productRepository.findOneById(id);
    }

    @Override
    public List<Product> getListProduct(int limit, int offset) {
        OffsetBasedPageRequest pageable = new OffsetBasedPageRequest(offset, limit, Sort.by("id").descending());
        return productRepository.findAllAndSort(pageable);
    }

    @Override
    public List<Product> getListProductByBrandId(Long id, int limit, int offset) {
        OffsetBasedPageRequest pageable = new OffsetBasedPageRequest(offset, limit, Sort.by("id").descending());
        return productRepository.findAllByBranchId(id, pageable);
    }

    @Override
    public int getCount() {
        return (int) productRepository.count();
    }

    @Override
    public List<Product> search(String searchValue, int limit, int offset) {
        OffsetBasedPageRequest pageable = new OffsetBasedPageRequest(offset, limit, Sort.by("id").descending());
        return productRepository.findByProductNameOrBrandName(searchValue, pageable);
    }

    @Override
    public void createProduct(CreateProductRequest createProductRequest, String productImage, String createBy) {
        Product product = new Product();
        BeanUtils.copyProperties(createProductRequest, product);
        product.setQuantity(Integer.parseInt(createProductRequest.getQuantity()));
        product.setUnitPrice(Long.parseLong(createProductRequest.getUnitPrice()));
        product.setProductImage(productImage);
        product.setCreateBy(createBy);
        product.setCreateDate(new Date());
        Long branchId = createProductRequest.getBranchId();
        if (branchId != null) {
            ProductBrand brand = brandRepository.findProductBranchById(branchId);
            product.setBrand(brand);
        }
        productRepository.save(product);
    }

    @Override
    public void updateProduct(Product product, UpdateProductRequest updateProductRequest, String productImage, String updateBy, Long id) {
        BeanUtils.copyProperties(updateProductRequest, product);
        product.setQuantity(Integer.parseInt(updateProductRequest.getQuantity()));
        product.setUnitPrice(Long.parseLong(updateProductRequest.getUnitPrice()));
        product.setProductImage(productImage);
        product.setUpdateBy(updateBy);
        product.setUpdateDate(new Date());
        Long branchId = updateProductRequest.getBranchId();
        if (branchId != null) {
            ProductBrand brand = brandRepository.findProductBranchById(branchId);
            product.setBrand(brand);
        }
        productRepository.save(product);
    }

    @Override
    public boolean deleteProduct(Product product) {
        if (lineItemService.findByProduct(product).isEmpty()) {
            productRepository.delete(product);
            return true;
        }
        return false;
    }

    @Override
    public boolean productNameValid(String productName) {
        return (productRepository.findByName(productName) == null);
    }
}
