package com.nhom8.camera.repository;

import com.nhom8.camera.entity.Product;
import com.nhom8.camera.model.response.ProductResponse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Date;

public interface ProductRepository extends JpaRepository<Product, Long> {

    @Query("select p from Product p where p.unitPrice = :unitPrice and p.createDate = :createDate")
    Product findByUnitPriceAndCreateDateCustom(@Param(value = "unitPrice") Long unitPrice,
                                              @Param(value = "createDate") Date createDate);

    Product findByUnitPriceAndCreateDate(Long unitPrice, Date createDate);

}
