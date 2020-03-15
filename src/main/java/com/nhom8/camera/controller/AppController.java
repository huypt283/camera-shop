package com.nhom8.camera.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AppController {
   /* @GetMapping(value = {"/","/home","index"})
    public String index() {

        return "web/index";
    }*/
    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/logout")
    public String logout() {
        return "redirect:/login";
    }
    @GetMapping("register")
    public String register() {
    	return "web/register";
    }
//    @GetMapping("/product")
//    public String product() {
//    	return "web/product";
//    }
    @GetMapping("/typo")
    public String typo() {
    	return "web/typo";
    }
  /*  @GetMapping("/checkout")
    public String checkout() {
    	return "web/checkout";
    }*/
    @GetMapping("/404")
    public String web404() {
    	return "web/404";
    }
    @GetMapping("/contact")
    public String contact() {
    	return "web/contact";
    }
    @GetMapping("/wishlist")
    public String wishlist() {
    	return "web/wishlist";
    }

//    @GetMapping("/single")
//    public String single(){
//    	return "web/single";
//    }
 
}
