package com.nhom8.camera.repository;

import com.nhom8.camera.entity.Product;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


import java.util.Date;
import java.util.List;
import java.util.Optional;

public interface ProductRepository extends JpaRepository<Product, Long> {
    Product findByUnitPriceAndCreateDate(Long unitPrice, Date createDate);

    @Query("select p from Product p where p.id = :id")
    Product findOneById(@Param(value = "id") Long id);

    @Query("select p from Product p")
    List<Product> findAllAndSort(Pageable pageable);

    @Query("select p from Product p where p.brand.id = :id")
    List<Product> findAllByBranchId(@Param(value = "id") Long id, Pageable pageable);

    @Query("select p from Product p where p.brand.name like %:search% or p.name like %:search%")
    List<Product> findByProductNameOrBranchName(@Param(value = "search") String value, Pageable pageable);

    Product findByName(String name);

    List<Product> findByBrand_Id(Long branchId);
}
