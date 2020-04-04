package com.nhom8.camera.repository;

import com.nhom8.camera.entity.ProductBranch;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProductBranchRepository extends JpaRepository<ProductBranch, Long> {

    @Query("select p from ProductBranch  p order by p.name")
    List<ProductBranch> findAllByArrangeName();
}
