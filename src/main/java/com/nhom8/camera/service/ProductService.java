package com.nhom8.camera.service;

import com.nhom8.camera.entity.Product;
import com.nhom8.camera.model.response.ProductResponse;

import java.util.List;

public interface ProductService {
    Product getSingleProductById(Long id);
    List<Product> getListProduct(int limit, int offset);
    List<Product> getListProductByBranhId(Long id);
}
