package com.nhom8.camera.controller.admin;

import com.nhom8.camera.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class OrderManageController {
    private OrderRepository orderRepository;

    @Autowired
    public OrderManageController(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    @GetMapping("/list-order")
    public ModelAndView listOrder() {
        ModelAndView mav = new ModelAndView("/admin/order-table");
        mav.addObject("totalPage", 10);
        return mav;
    }
}
