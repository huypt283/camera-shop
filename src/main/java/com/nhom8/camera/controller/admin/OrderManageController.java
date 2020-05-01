package com.nhom8.camera.controller.admin;

import com.nhom8.camera.entity.LineItem;
import com.nhom8.camera.entity.Order;
import com.nhom8.camera.model.request.UpdateOrderAdminRequest;
import com.nhom8.camera.model.response.OrderResponse;
import com.nhom8.camera.repository.LineItemRepository;
import com.nhom8.camera.repository.OrderRepository;
import com.nhom8.camera.service.OrderService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
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

    @GetMapping("/order/{id}")
    public ModelAndView updateOrderGet(@PathVariable final Long id, @ModelAttribute UpdateOrderAdminRequest updateOrder) {
        ModelAndView mav = new ModelAndView();
        return mav;
    }

    @PostMapping("/odder/{id}")
    public String updateOrderPost(@PathVariable final Long id, @ModelAttribute UpdateOrderAdminRequest updateOrder, BindingResult bindingResult, ModelMap modelMap) {

        return "redirect:/admin/list-order";
    }
}
