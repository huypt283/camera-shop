//package com.nhom8.camera.controller.web;
//
//import com.nhom8.camera.model.request.CheckoutRequest;
//import com.nhom8.camera.security.CustomUserDetails;
//import com.nhom8.camera.service.OrderService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.annotation.AuthenticationPrincipal;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RestController;
//
//@RestController
//public class TestController {
//    private OrderService orderService;
//
//    @Autowired
//    public TestController(OrderService orderService) {
//        this.orderService = orderService;
//    }
//
//    @PostMapping("/testbuy")
//    public void test(@RequestBody CheckoutRequest checkoutRequest, @AuthenticationPrincipal CustomUserDetails userDetails) {
//        orderService.saveOrder(userDetails.getId(), checkoutRequest.getOrderRequest(), checkoutRequest.getLineItemRequests());
//    }
//}
