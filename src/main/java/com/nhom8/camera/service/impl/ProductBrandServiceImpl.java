package com.nhom8.camera.service.impl;

import com.nhom8.camera.entity.ProductBrand;
import com.nhom8.camera.repository.ProductBrandRepository;
import com.nhom8.camera.service.ProductBrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductBrandServiceImpl implements ProductBrandService {
   private ProductBrandRepository productBrandRepository;

   @Autowired
   public ProductBrandServiceImpl(ProductBrandRepository productBrandRepository){this.productBrandRepository = productBrandRepository;}


    @Override
    public List<ProductBrand> getListProductBrand() {
        return productBrandRepository.findAllByArrangeName();
    }
}
