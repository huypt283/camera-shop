package com.nhom8.camera.controller.web;
import com.nhom8.camera.model.request.CheckoutRequest;
import com.nhom8.camera.security.CustomUserDetails;
import com.nhom8.camera.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class OrderController {
    private OrderService orderService;

    @Autowired
    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping("/order")
    public String order(@AuthenticationPrincipal CustomUserDetails userDetails)
    {
        if (userDetails == null){
            return "redirect:/login";
        }
        else {
            return "web/test1";
        }
    }

    @PostMapping("/order")
    public ModelAndView submitOrder(@AuthenticationPrincipal CustomUserDetails userDetails, @RequestBody CheckoutRequest checkoutRequest)
    {
        ModelAndView mav = new ModelAndView("web/index");
        orderService.saveOrder(userDetails.getId(), checkoutRequest.getOrderRequest(), checkoutRequest.getLineItemRequests());
        return mav;
    }
}
