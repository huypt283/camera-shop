package com.nhom8.camera.service.impl;

import com.nhom8.camera.entity.LineItem;
import com.nhom8.camera.entity.Order;
import com.nhom8.camera.entity.Product;
import com.nhom8.camera.entity.User;
import com.nhom8.camera.model.request.LineItemRequest;
import com.nhom8.camera.model.request.OffsetBasedPageRequest;
import com.nhom8.camera.model.request.OrderRequest;
import com.nhom8.camera.repository.LineItemRepository;
import com.nhom8.camera.repository.OrderRepository;
import com.nhom8.camera.repository.UserRepository;
import com.nhom8.camera.service.LineItemService;
import com.nhom8.camera.service.OrderService;
import com.nhom8.camera.service.ProductService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
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
    private LineItemRepository lineItemRepository;

    @Autowired
    public OrderServiceImpl(OrderRepository orderRepository,
                            LineItemService lineItemService,
                            UserRepository userRepository,
                            ProductService productService,
                            LineItemRepository lineItemRepository){
        this.orderRepository = orderRepository;
        this.lineItemService = lineItemService;
        this.userRepository = userRepository;
        this.productService = productService;
        this.lineItemRepository = lineItemRepository;
    }

    @Override
    public Order findById(Long id) {
        return orderRepository.findOrderById(id);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void saveOrder(Long userId, OrderRequest orderRequest, List<LineItemRequest> lineItemRequests) {
        User user = userRepository.findUserById(userId);

        Order order = new Order();
        order.setUser(user);
        BeanUtils.copyProperties(orderRequest, order);
        order.setOrderDate(new Date());
        order.setStatus("Waiting");
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

    @Override
    public List<Order> findOrderList(int limit, int offset) {
        OffsetBasedPageRequest pageable = new OffsetBasedPageRequest(offset, limit, Sort.by("id").descending());
        return orderRepository.findOrderList(pageable);
    }

    @Override
    public void updateOrderStatus(Long id, String status) {
        Order order = orderRepository.findOrderById(id);
        order.setStatus(status);
        orderRepository.save(order);
    }

    @Override
    public List<Order> findOrderHistory(Long userId, int limit, int offset) {
        OffsetBasedPageRequest pageable = new OffsetBasedPageRequest(offset, limit, Sort.by("id").descending());
        return orderRepository.findOrderListByUserId(userId, pageable);
    }
}
