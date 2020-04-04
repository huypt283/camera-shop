package com.nhom8.camera.controller.web;

        //import jdk.nashorn.internal.ir.annotations.Reference;
        import com.nhom8.camera.entity.ProductBranch;
        import com.nhom8.camera.service.ProductBranchService;
        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.stereotype.Controller;
        import org.springframework.web.bind.annotation.GetMapping;
        import org.springframework.web.bind.annotation.RequestMapping;
        import org.springframework.web.servlet.ModelAndView;

        import java.util.List;

@Controller
@RequestMapping("/checkout")
public class CheckOutController {
    private ProductBranchService productBranchService;

    @Autowired
    public CheckOutController(ProductBranchService productBranchService) {
        this.productBranchService = productBranchService;
    }

    @GetMapping
    public ModelAndView checkout(){
        ModelAndView mav = new ModelAndView("web/checkout");
        List<ProductBranch> lstProductBranch = productBranchService.getListProductBranch();
        mav.addObject("lstProductBranch", lstProductBranch);
        return mav;
    }
}
