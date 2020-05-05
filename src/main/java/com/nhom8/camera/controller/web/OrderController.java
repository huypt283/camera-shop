package com.nhom8.camera.controller.web;

import com.nhom8.camera.entity.LineItem;
import com.nhom8.camera.entity.Order;
import com.nhom8.camera.entity.ProductBranch;
import com.nhom8.camera.model.request.CheckoutRequest;
import com.nhom8.camera.model.response.OrderResponse;
import com.nhom8.camera.repository.LineItemRepository;
import com.nhom8.camera.security.CustomUserDetails;
import com.nhom8.camera.service.OrderService;
import com.nhom8.camera.service.ProductBranchService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.function.Predicate;

@Controller
public class OrderController {
    private OrderService orderService;
    private ProductBranchService productBranchService;
    private LineItemRepository lineItemRepository;

    @Autowired
    public OrderController(OrderService orderService, ProductBranchService productBranchService, LineItemRepository lineItemRepository) {
        this.orderService = orderService;
        this.productBranchService = productBranchService;
        this.lineItemRepository = lineItemRepository;
    }

    @GetMapping("checkout")
    public ModelAndView checkout() {
        ModelAndView mav = new ModelAndView("web/checkout");
        List<ProductBranch> lstProductBranch = productBranchService.getListProductBranch();
        mav.addObject("lstProductBranch", lstProductBranch);
        return mav;
    }

    @GetMapping("/order")
    public String submitOrderGet(ModelMap modelMap) {
        List<ProductBranch> lstProductBranch = productBranchService.getListProductBranch();
        modelMap.addAttribute("lstProductBranch", lstProductBranch);
        return "/web/order";
    }

    @PostMapping("/order")
    public String submitOrderPost(@AuthenticationPrincipal CustomUserDetails userDetails, @RequestBody CheckoutRequest checkoutRequest, ModelMap modelMap) {
        if (checkoutRequest.getLineItemRequests() != null)
            if (checkoutRequest.getLineItemRequests().size() > 0) {
                orderService.saveOrder(userDetails.getId(), checkoutRequest.getOrderRequest(), checkoutRequest.getLineItemRequests());
                modelMap.addAttribute("message", "Cám ơn bạn đã đặt hàng, chúng tôi sẽ liên hệ với bạn sớm nhất");
                return "/web/direct-message";
            }
        modelMap.addAttribute("message", "Bạn chưa có hàng trong giỏ");
        return "/web/direct-message";
    }

    @GetMapping("/order-history")
    public ModelAndView orderHistoryGet(@AuthenticationPrincipal CustomUserDetails userDetails, @RequestParam(value = "limit", defaultValue = "20") int limit) {
        List<ProductBranch> lstProductBranch = productBranchService.getListProductBranch();
        List<Order> orders = orderService.findOrderHistory(userDetails.getId(), limit, 0);
        ModelAndView mav;
        if (!orders.isEmpty()) {
            mav = new ModelAndView("/web/order-history");
            mav.addObject("lstProductBranch", lstProductBranch);
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
        } else {
            mav = new ModelAndView("/web/direct-message");
            mav.addObject("lstProductBranch", lstProductBranch);
            mav.addObject("message", "Bạn chưa có đơn hàng nào");
        }
        return mav;
    }

    @GetMapping("/order/{id}")
    public ModelAndView orderDetailGet(@AuthenticationPrincipal CustomUserDetails userDetails, @PathVariable(value = "id") Long orderId) {
        List<ProductBranch> lstProductBranch = productBranchService.getListProductBranch();
        Order order = orderService.findById(orderId);
        Set<GrantedAuthority> grantedAuthorities = new HashSet<>(userDetails
                .getAuthorities());
        ModelAndView mav;
        if (order != null && (userDetails.getId() == order.getUser().getId() || isAdmin(grantedAuthorities))) {
            mav = new ModelAndView("/web/order-detail");
            mav.addObject("lstProductBranch", lstProductBranch);
            OrderResponse orderResponse = new OrderResponse();
            BeanUtils.copyProperties(order, orderResponse);
            orderResponse.setUserName(order.getUser().getUserName());
            List<LineItem> lineItems = lineItemRepository.findByOrder_Id(order.getId());
            orderResponse.setItemList(lineItems);
            mav.addObject("order", orderResponse);
        } else {
            mav = new ModelAndView("/web/direct-message");
            mav.addObject("lstProductBranch", lstProductBranch);
            mav.addObject("message", "Không tồn tại đơn hàng này hoặc bạn không có quyền xem");
        }
        return mav;
    }

    private boolean isAdmin(Set<GrantedAuthority> grantedAuthorities) {
        Predicate<GrantedAuthority> compare = s -> s.getAuthority().equals("ROLE_ADMIN");
        return grantedAuthorities.stream().anyMatch(compare);
    }
}
