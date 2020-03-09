package com.nhom8.camera.service.impl;

import com.nhom8.camera.entity.Product;
import com.nhom8.camera.model.response.ProductResponse;
import com.nhom8.camera.repository.ProductRepository;
import com.nhom8.camera.service.ProductService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {
    private ProductRepository productRepository;

    @Autowired
    public ProductServiceImpl(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    @Override
    public ProductResponse getSingleProductById(Long id) {
        Product product = productRepository.getOne(id);
        ProductResponse productResponse = new ProductResponse();

        //product là model muốn chuyển dữ liệu vào productResponse
        BeanUtils.copyProperties(productResponse, product);


        return productResponse;
    }
}
