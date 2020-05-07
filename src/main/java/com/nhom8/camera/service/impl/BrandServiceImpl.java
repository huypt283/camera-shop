package com.nhom8.camera.service.impl;

import com.nhom8.camera.entity.Product;
import com.nhom8.camera.entity.ProductBrand;
import com.nhom8.camera.model.request.OffsetBasedPageRequest;
import com.nhom8.camera.repository.BrandRepository;
import com.nhom8.camera.repository.ProductRepository;
import com.nhom8.camera.service.BrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BrandServiceImpl implements BrandService {
    private BrandRepository brandRepository;
    private ProductRepository productRepository;

    @Autowired
    public BrandServiceImpl(BrandRepository brandRepository, ProductRepository productRepository) {
        this.brandRepository = brandRepository;
        this.productRepository = productRepository;
    }

    @Override
    public List<ProductBrand> getListBranch() {
        return brandRepository.findAll();
    }

    @Override
    public List<ProductBrand> getListBranch(int limit, int offset) {
        OffsetBasedPageRequest pageable = new OffsetBasedPageRequest(offset, limit, Sort.by("id").ascending());
        return brandRepository.findListBranch(pageable);
    }

    @Override
    public ProductBrand getBranchById(Long id) {
        return brandRepository.findOneById(id);
    }

    @Override
    public void createBranch(String name) {
        ProductBrand branch = new ProductBrand();
        branch.setName(name);
        brandRepository.save(branch);
    }

    @Override
    public void updateBranch(ProductBrand branch, String name) {
        branch.setName(name);
        brandRepository.save(branch);
    }

    @Override
    public void deleteBranch(Long id) {
        List<Product> products = productRepository.findByBrand_Id(id);
        if(products.isEmpty())
            brandRepository.deleteById(id);
    }
}
