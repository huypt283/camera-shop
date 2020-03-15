package com.nhom8.camera.service.impl;

import com.nhom8.camera.entity.Product;
import com.nhom8.camera.model.request.OffsetBasedPageRequest;
import com.nhom8.camera.model.response.ProductResponse;
import com.nhom8.camera.repository.ProductRepository;
import com.nhom8.camera.service.ProductService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class ProductServiceImpl implements ProductService {
    private ProductRepository productRepository;

    @Autowired
    public ProductServiceImpl(ProductRepository productRepository) {
        this.productRepository = productRepository;
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
    public List<Product> getListProductByBranhId(Long id) {
        List<Product> products=productRepository.findAllByBranchId(id);
        return products;
    }
}
