package com.nhom8.camera.service;

import com.nhom8.camera.model.request.LineItemRequest;
import com.nhom8.camera.model.request.OrderRequest;

import java.util.List;

public interface OrderService {
    void saveOrder(Long userId, OrderRequest orderRequest, List<LineItemRequest> lineItemRequests);
}
