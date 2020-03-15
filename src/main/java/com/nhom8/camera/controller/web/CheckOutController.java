package com.nhom8.camera.controller.web;

        //import jdk.nashorn.internal.ir.annotations.Reference;
        import org.springframework.stereotype.Controller;
        import org.springframework.web.bind.annotation.GetMapping;
        import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sell_cameras/checkout")
public class CheckOutController {

    @GetMapping
    public String checkout(){
        return "web/checkout";
    }
}
