package com.nhom8.camera.service;

import com.nhom8.camera.entity.Product;
import com.nhom8.camera.model.response.ProductResponse;

public interface ProductService {
    ProductResponse getSingleProductById(Long id);
}
