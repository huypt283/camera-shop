package com.nhom8.camera.repository;

import com.nhom8.camera.entity.LineItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface LineItemRepository extends JpaRepository<LineItem, Long> {
}
