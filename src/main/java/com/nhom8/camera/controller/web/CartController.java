//package com.nhom8.camera.controller.web;
//
//import com.nhom8.camera.entity.Product;
//import com.nhom8.camera.entity.ProductBranch;
//import com.nhom8.camera.model.Cart;
//import com.nhom8.camera.service.ProductBranchService;
//import com.nhom8.camera.service.ProductService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.ModelMap;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.ModelAndView;
//
//import javax.servlet.http.HttpSession;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//@Controller
//@RequestMapping("/cart")
//public class CartController {
//private ProductService productService;
//@Autowired
//    public CartController(ProductService productService){this.productService=productService; }
//    @GetMapping("/add/productId={id}")
//    public String viewAdd(ModelMap mm, HttpSession session, @PathVariable(name = "id") Long id){
//        HashMap<Long, Cart> cartItems = (HashMap<Long, Cart>) session.getAttribute("myCartItems");
//        if(cartItems == null) {
//            cartItems = new HashMap<>();
//        }
//        Product product = productService.getSingleProductById(id);
//        if(product != null){
//            if(cartItems.containsKey(id)){
//                Cart item= cartItems.get(id);
//                item.setProduct(product);
//                item.setQuantity(item.getQuantity()+1);
//                cartItems.put(id,item);
//            }else {
//                Cart item = new Cart();
//                item.setProduct(product);
//                item.setQuantity(1);
//                cartItems.put(id,item);
//            }
//            session.setAttribute("myCartItems",cartItems);
//            session.setAttribute("myCartToTal", totalPrice(cartItems));
//            session.setAttribute("myCartNum",cartItems.size());
//        }
//
//        return "web/checkout";
//    }
//
//
//
//
//    public long totalPrice(HashMap<Long, Cart> cartItems) {
//    long  count=0;
//    for (Map.Entry<Long,Cart> list: cartItems.entrySet()){
//        count+= list.getValue().getProduct().getUnitPrice() * list.getValue().getQuantity();
//    }
//        return count;
//    }
//}
