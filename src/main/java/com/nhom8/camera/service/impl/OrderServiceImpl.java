package com.nhom8.camera.service.impl;

import com.nhom8.camera.entity.LineItem;
import com.nhom8.camera.entity.Order;
import com.nhom8.camera.entity.Product;
import com.nhom8.camera.entity.User;
import com.nhom8.camera.model.request.LineItemRequest;
import com.nhom8.camera.model.request.OrderRequest;
import com.nhom8.camera.repository.OrderRepository;
import com.nhom8.camera.repository.UserRepository;
import com.nhom8.camera.service.LineItemService;
import com.nhom8.camera.service.OrderService;
import com.nhom8.camera.service.ProductService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    private OrderRepository orderRepository;
    private LineItemService lineItemService;
    private UserRepository userRepository;
    private ProductService productService;

    @Autowired
    public OrderServiceImpl(OrderRepository orderRepository, LineItemService lineItemService, UserRepository userRepository, ProductService productService){
        this.orderRepository = orderRepository;
        this.lineItemService = lineItemService;
        this.userRepository = userRepository;
        this.productService = productService;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void saveOrder(Long userId, OrderRequest orderRequest, List<LineItemRequest> lineItemRequests) {
        User user = userRepository.findUserById(userId);

        Order order = new Order();
        order.setUser(user);
        BeanUtils.copyProperties(orderRequest, order);
        order.setOrderDate(new Date());
        order.setDiscount(null);
        Order orderSave = orderRepository.save(order);

        List<LineItem> lineItems = new ArrayList<>();

        for (LineItemRequest lineItemRequest : lineItemRequests) {
            LineItem lineItem = new LineItem();
            Product productSave = productService.getSingleProductById(lineItemRequest.getProductId());
            lineItem.setOrder(orderSave);
            lineItem.setProduct(productSave);
            lineItem.setQuantity(lineItemRequest.getQuantity());
            lineItem.setUnitPrice(lineItemRequest.getUnitPrice());
            lineItems.add(lineItem);
        }
        lineItemService.saveAllLineItem(lineItems);
    }
}
