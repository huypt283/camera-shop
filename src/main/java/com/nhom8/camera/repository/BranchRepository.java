package com.nhom8.camera.repository;

import com.nhom8.camera.entity.ProductBranch;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface BranchRepository extends JpaRepository<ProductBranch, Long> {
    ProductBranch findProductBranchById(Long id);

    ProductBranch findOneById(Long id);

    ProductBranch findByName(String name);

    void deleteById(Long id);

    @Query("select b from ProductBranch b")
    List<ProductBranch> findListBranch(Pageable pageable);
}
