package com.nhom8.camera.repository;

import com.nhom8.camera.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface OrderRepository extends JpaRepository<Order,Long> {

    @Query("select max(o.id) from Order o where o.user.id = :userid")
    Long findMaxIdOrderByUserId(@Param(value = "userid") Long userId);


}
