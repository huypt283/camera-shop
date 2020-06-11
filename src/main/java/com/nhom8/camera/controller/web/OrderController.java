package com.nhom8.camera.controller.web;

import com.nhom8.camera.entity.LineItem;
import com.nhom8.camera.entity.Order;
import com.nhom8.camera.entity.ProductBrand;
import com.nhom8.camera.model.request.CheckoutRequest;
import com.nhom8.camera.model.response.OrderResponse;
import com.nhom8.camera.repository.LineItemRepository;
import com.nhom8.camera.security.CustomUserDetails;
import com.nhom8.camera.service.OrderService;
import com.nhom8.camera.service.ProductBrandService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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
    private ProductBrandService productBrandService;
    private LineItemRepository lineItemRepository;

    @Autowired
    public OrderController(OrderService orderService, ProductBrandService productBrandService, LineItemRepository lineItemRepository) {
        this.orderService = orderService;
        this.productBrandService = productBrandService;
        this.lineItemRepository = lineItemRepository;
    }

    @GetMapping("checkout")
    public ModelAndView checkout() {
        ModelAndView mav = new ModelAndView("web/checkout");
        List<ProductBrand> lstProductBrands = productBrandService.getListProductBrand();
        mav.addObject("lstProductBrand", lstProductBrands);
        return mav;
    }

    @GetMapping("/order")
    public String submitOrderGet(ModelMap modelMap) {
        List<ProductBrand> lstProductBrands = productBrandService.getListProductBrand();
        modelMap.addAttribute("lstProductBrand", lstProductBrands);
        modelMap.addAttribute("message", "Vui lòng nhập đầy đủ thông tin của bạn để đặt hàng");
        return "/web/order";
    }

    @GetMapping("/order-result")
    public String orderResultGet(@RequestParam(value = "error", defaultValue = "true") String error, ModelMap modelMap) {
        List<ProductBrand> lstProductBrands = productBrandService.getListProductBrand();
        modelMap.addAttribute("lstProductBrand", lstProductBrands);
        if (error.equalsIgnoreCase("false"))
            modelMap.addAttribute("message", "Đặt hàng thành công");
        else
            modelMap.addAttribute("message", "Đặt hàng thất bại. Bạn chưa có sản phẩm nào trong giỏ");
        return "/web/order-result";
    }

    @PostMapping("/order")
    @ResponseBody
    public ResponseEntity<?> submitOrderPost(@AuthenticationPrincipal CustomUserDetails userDetails, @RequestBody CheckoutRequest checkoutRequest) {
        if (checkoutRequest.getLineItemRequests() != null)
            if (checkoutRequest.getLineItemRequests().size() > 0) {
                orderService.saveOrder(userDetails.getId(), checkoutRequest.getOrderRequest(), checkoutRequest.getLineItemRequests());
                return ResponseEntity.status(200).build();
            }
        return ResponseEntity.status(400).build();
    }

    @GetMapping("/order-history")
    public ModelAndView orderHistoryGet(@AuthenticationPrincipal CustomUserDetails userDetails, @RequestParam(value = "limit", defaultValue = "20") int limit) {
        List<ProductBrand> lstProductBrands = productBrandService.getListProductBrand();
        List<Order> orders = orderService.findOrderHistory(userDetails.getId(), limit, 0);
        ModelAndView mav;
        if (!orders.isEmpty()) {
            mav = new ModelAndView("/web/order-history");
            mav.addObject("lstProductBrand", lstProductBrands);
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
            mav.addObject("lstProductBrand", lstProductBrands);
            mav.addObject("message", "Bạn chưa có đơn hàng nào");
        }
        return mav;
    }

    @GetMapping("/order/{id}")
    public ModelAndView orderDetailGet(@AuthenticationPrincipal CustomUserDetails userDetails, @PathVariable(value = "id") Long orderId) {
        List<ProductBrand> lstProductBrands = productBrandService.getListProductBrand();
        Order order = orderService.findById(orderId);
        Set<GrantedAuthority> grantedAuthorities = new HashSet<>(userDetails
                .getAuthorities());
        ModelAndView mav;
        if (order != null && (userDetails.getId() == order.getUser().getId() || isAdmin(grantedAuthorities))) {
            mav = new ModelAndView("/web/order-detail");
            mav.addObject("lstProductBrand", lstProductBrands);
            OrderResponse orderResponse = new OrderResponse();
            BeanUtils.copyProperties(order, orderResponse);
            orderResponse.setUserName(order.getUser().getUserName());
            List<LineItem> lineItems = lineItemRepository.findByOrder_Id(order.getId());
            orderResponse.setItemList(lineItems);
            mav.addObject("order", orderResponse);
        } else {
            mav = new ModelAndView("/web/direct-message");
            mav.addObject("lstProductBrand", lstProductBrands);
            mav.addObject("message", "Không tồn tại đơn hàng này hoặc bạn không có quyền xem");
        }
        return mav;
    }

    private boolean isAdmin(Set<GrantedAuthority> grantedAuthorities) {
        Predicate<GrantedAuthority> compare = s -> s.getAuthority().equals("ROLE_ADMIN");
        return grantedAuthorities.stream().anyMatch(compare);
    }
}
