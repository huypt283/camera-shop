package com.nhom8.camera.repository;

import com.nhom8.camera.entity.ProductBrand;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProductBrandRepository extends JpaRepository<ProductBrand, Long> {

    @Query("select p from ProductBrand  p order by p.name")
    List<ProductBrand> findAllByArrangeName();
}
