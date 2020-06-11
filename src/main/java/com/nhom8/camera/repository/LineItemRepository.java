package com.nhom8.camera.repository;

import com.nhom8.camera.entity.LineItem;
import com.nhom8.camera.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface LineItemRepository extends JpaRepository<LineItem, Long> {
    List<LineItem> findByOrder_Id(Long id);
    List<LineItem> findByProduct(Product product);
}
