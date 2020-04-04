package com.nhom8.camera.controller.admin;

import com.nhom8.camera.entity.LineItem;
import com.nhom8.camera.entity.Order;
import com.nhom8.camera.entity.Product;
import com.nhom8.camera.model.response.OrderResponse;
import com.nhom8.camera.repository.LineItemRepository;
import com.nhom8.camera.repository.OrderRepository;
import com.nhom8.camera.service.OrderService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class OrderManageController {
    private final int limit = 10;

    private OrderRepository orderRepository;
    private OrderService orderService;
    private LineItemRepository lineItemRepository;

    @Autowired
    public OrderManageController(OrderRepository orderRepository, OrderService orderService, LineItemRepository lineItemRepository) {
        this.orderRepository = orderRepository;
        this.orderService = orderService;
        this.lineItemRepository = lineItemRepository;
    }

    @GetMapping("/list-order")
    public ModelAndView listOrder(@RequestParam(value = "page", defaultValue = "1") int page) {
        ModelAndView mav = new ModelAndView("/admin/order-table");
        int offset = (page-1)*limit;
        List<Order> orders = orderService.findOrderList(limit, offset);
        long totalPage = orderRepository.count()/limit + 1;
        mav.addObject("totalPage", totalPage);
        List<OrderResponse> orderResponses = new ArrayList<>();
        for (Order order : orders) {
            OrderResponse orderResponse = new OrderResponse();
            BeanUtils.copyProperties(order, orderResponse);
            orderResponse.setUserName(order.getUser().getUserName());
            List<LineItem> lineItems = lineItemRepository.findByOrder_Id(order.getId());
            orderResponse.setItemList(lineItems);
            orderResponses.add(orderResponse);
        }
        mav.addObject("orders", orderResponses);
        return mav;
    }

    @GetMapping("/order-delete/{id}")
    public String deleteOrder(@PathVariable Long id) {
        orderService.deleteOrder(id);
        return "redirect:/admin/list-order";
    }
}
