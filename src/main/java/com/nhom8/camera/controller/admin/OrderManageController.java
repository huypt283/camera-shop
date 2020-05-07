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

import javax.validation.Valid;
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
    public ModelAndView updateOrderGet(@PathVariable final Long id, @ModelAttribute(value = "updateOrder") UpdateOrderAdminRequest updateOrder) {
        Order order = orderService.findById(id);
        ModelAndView mav;

        if (order != null) {
            mav = new ModelAndView("/admin/order-update");
            OrderResponse orderResponse = new OrderResponse();
            BeanUtils.copyProperties(order, orderResponse);
            orderResponse.setUserName(order.getUser().getUserName());
            List<LineItem> lineItems = lineItemRepository.findByOrder_Id(order.getId());
            orderResponse.setItemList(lineItems);
            mav.addObject("order", orderResponse);
            List<String> listStatus = new ArrayList<>();
            listStatus.add("Received");
            listStatus.add("Cancelled");
            listStatus.add("Waiting");
            mav.addObject("listStatus", listStatus);
        } else {
            mav = new ModelAndView("/admin/direct-message");
            mav.addObject("message", "Không tìm thấy hóa đơn này");
        }
        return mav;
    }

    @PostMapping("/order/{id}")
    public String updateOrderPost(@PathVariable final Long id, @Valid @ModelAttribute(value = "updateOrder") UpdateOrderAdminRequest updateOrder, BindingResult result, ModelMap modelMap) {
        if(result.hasErrors()) {
            List<String> listStatus = new ArrayList<>();
            listStatus.add("Received");
            listStatus.add("Cancelled");
            listStatus.add("Waiting");
            modelMap.addAttribute("listStatus", listStatus);
            return "/admin/order-update";
        }
        if(orderService.updateOrderStatus(id, updateOrder.getStatus())) {
            return "redirect:/admin/list-order";
        } else {
            modelMap.addAttribute("message", "Có sản phẩm đã hết hàng, cần nhập thêm trước khi xác nhận đơn hàng này đã nhận.");
            return "/admin/direct-message";
        }
    }
}
