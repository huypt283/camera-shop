package com.nhom8.camera.repository;

import com.nhom8.camera.entity.ProductBrand;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface BrandRepository extends JpaRepository<ProductBrand, Long> {
    ProductBrand findProductBranchById(Long id);

    ProductBrand findOneById(Long id);

    ProductBrand findByName(String name);

    void deleteById(Long id);

    @Query("select b from ProductBrand b")
    List<ProductBrand> findListBranch(Pageable pageable);
}
