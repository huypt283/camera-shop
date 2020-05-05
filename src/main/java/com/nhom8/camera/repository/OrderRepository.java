package com.nhom8.camera.repository;

import com.nhom8.camera.entity.Order;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order,Long> {

    @Query("select max(o.id) from Order o where o.user.id = :userid")
    Long findMaxIdOrderByUserId(@Param(value = "userid") Long userId);

    @Query("select o from Order o")
    List<Order> findOrderList(Pageable pageable);

    @Query("select o from Order o where o.user.id = :userid")
    List<Order> findOrderListByUserId(@Param(value = "userid") Long userId, Pageable pageable);

    Order findOrderById(Long id);

    void deleteById(Long id);
}
