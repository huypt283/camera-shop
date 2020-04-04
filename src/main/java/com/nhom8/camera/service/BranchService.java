package com.nhom8.camera.service;

import com.nhom8.camera.entity.ProductBranch;

import java.util.List;

public interface BranchService {
    List<ProductBranch> getListBranch();
    List<ProductBranch> getListBranch(int limit, int offset);
    ProductBranch getBranchById(Long id);
    void createBranch(String name);
    void updateBranch(ProductBranch branch, String name);
    void deleteBranch(Long id);
}
