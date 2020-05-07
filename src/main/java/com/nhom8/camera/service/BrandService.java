package com.nhom8.camera.service;

import com.nhom8.camera.entity.ProductBrand;

import java.util.List;

public interface BrandService {
    List<ProductBrand> getListBranch();
    List<ProductBrand> getListBranch(int limit, int offset);
    ProductBrand getBranchById(Long id);
    void createBranch(String name);
    void updateBranch(ProductBrand branch, String name);
    void deleteBranch(Long id);
}
