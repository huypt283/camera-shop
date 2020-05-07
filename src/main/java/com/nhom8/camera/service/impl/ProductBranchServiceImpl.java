package com.nhom8.camera.service.impl;

import com.nhom8.camera.entity.ProductBrand;
import com.nhom8.camera.repository.ProductBrandRepository;
import com.nhom8.camera.service.ProductBranchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductBranchServiceImpl implements ProductBranchService {
   private ProductBrandRepository productBrandRepository;

   @Autowired
   public ProductBranchServiceImpl(ProductBrandRepository productBrandRepository){this.productBrandRepository = productBrandRepository;}


    @Override
    public List<ProductBrand> getListProductBranch() {
        return productBrandRepository.findAllByArrangeName();
    }
}
