package com.nhom8.camera.service;

import com.nhom8.camera.entity.Order;
import com.nhom8.camera.model.request.LineItemRequest;
import com.nhom8.camera.model.request.OrderRequest;

import java.util.List;

public interface OrderService {
    Order findById(Long id);
    void saveOrder(Long userId, OrderRequest orderRequest, List<LineItemRequest> lineItemRequests);
    List<Order> findOrderList(int limit, int offset);
    void updateOrderStatus(Long id, String status);
    List<Order> findOrderHistory(Long userId, int limit, int offset);
}
