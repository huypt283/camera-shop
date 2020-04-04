package com.nhom8.camera.service.impl;

import com.nhom8.camera.entity.Product;
import com.nhom8.camera.entity.ProductBranch;
import com.nhom8.camera.model.request.CreateProductRequest;
import com.nhom8.camera.model.request.OffsetBasedPageRequest;
import com.nhom8.camera.model.request.UpdateProductRequest;
import com.nhom8.camera.repository.BranchRepository;
import com.nhom8.camera.repository.ProductRepository;
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
    private BranchRepository branchRepository;

    @Autowired
    public ProductServiceImpl(ProductRepository productRepository, BranchRepository branchRepository) {
        this.productRepository = productRepository;
        this.branchRepository = branchRepository;
    }


    @Override
    public Product getSingleProductById(Long id) {
        Product product = productRepository.findOneById(id);
        return product;
    }

    @Override
    public List<Product> getListProduct(int limit, int offset) {
        OffsetBasedPageRequest pageable = new OffsetBasedPageRequest(offset, limit, Sort.by("id").descending());
        List<Product> products = productRepository.findAllAndSort(pageable);
        return products;
    }

    @Override
    public List<Product> getListProductByBranhId(Long id,int limit,int offset) {
        OffsetBasedPageRequest pageable = new OffsetBasedPageRequest(offset,limit, Sort.by("id").descending());
        List<Product> products=productRepository.findAllByBranchId(id,pageable);
        return products;
    }

    @Override
    public int getCount() {
        return (int) productRepository.count();
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
            ProductBranch branch = branchRepository.findProductBranchById(branchId);
            product.setBranch(branch);
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
            ProductBranch branch = branchRepository.findProductBranchById(branchId);
            product.setBranch(branch);
        }
        productRepository.save(product);
    }

    @Override
    public void deleteProduct(Product product) {
        productRepository.delete(product);
    }

    @Override
    public boolean productNameValid(String productName) {
        return (productRepository.findByName(productName) == null);
    }
}
