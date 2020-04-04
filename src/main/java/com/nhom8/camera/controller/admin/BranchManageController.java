package com.nhom8.camera.controller.admin;

import com.nhom8.camera.entity.Product;
import com.nhom8.camera.entity.ProductBranch;
import com.nhom8.camera.model.request.BranchRequest;
import com.nhom8.camera.repository.BranchRepository;
import com.nhom8.camera.repository.ProductRepository;
import com.nhom8.camera.service.BranchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class BranchManageController {
    private final int limit = 10;

    private BranchService branchService;
    private BranchRepository branchRepository;
    private ProductRepository productRepository;

    @Autowired
    public BranchManageController(BranchService branchService, BranchRepository branchRepository, ProductRepository productRepository) {
        this.branchService = branchService;
        this.branchRepository = branchRepository;
        this.productRepository = productRepository;
    }

    @GetMapping("/list-branch")
    public ModelAndView listBranch(@RequestParam(value = "page", defaultValue = "1") int page) {
        ModelAndView mav = new ModelAndView("/admin/branch-table");
        int offset = (page-1)*limit;
        List<ProductBranch> branches = branchService.getListBranch(limit, offset);
        long totalPage = branchRepository.count()/limit + 1;
        mav.addObject("totalPage", totalPage);
        mav.addObject("branches", branches);
        return mav;
    }

    @GetMapping("/branch")
    public ModelAndView createBranchGet(@ModelAttribute(value = "branchRequest") BranchRequest branchRequest) {
        return new ModelAndView("/admin/branch-create");
    }

    @PostMapping("/branch")
    public String createBranchPost(@Valid @ModelAttribute(value = "branchRequest") BranchRequest branchRequest, BindingResult result) {
        String name = branchRequest.getName();
        ProductBranch branch = branchRepository.findByName(name);
        if (branch != null) {
            result.addError(new FieldError("branchRequest", "name", "Branch name already exist"));
        }
        if(result.hasErrors()) {
            return "/admin/branch-create";
        }
        branchService.createBranch(name);
        return "redirect:/admin/list-branch";
    }

    @GetMapping("/branch/{id}")
    public ModelAndView updateBranchGet(@PathVariable(value = "id") final Long id, @ModelAttribute(value = "branchRequest") BranchRequest branchRequest) {
        ModelAndView mav = new ModelAndView("/admin/branch-update");
        ProductBranch branch = branchService.getBranchById(id);
        mav.addObject("branch", branch);
        return mav;
    }

    @PostMapping("/branch/{id}")
    public String updateBranchGet(@PathVariable(value = "id") final Long id, @Valid @ModelAttribute(value = "branchRequest") BranchRequest branchRequest, BindingResult result, ModelMap modelMap) {
        String name = branchRequest.getName();
        ProductBranch branch = branchService.getBranchById(id);
        if (branch.getName().equals(name)) {
            result.addError(new FieldError("branchRequest", "name", "Branch name already exist"));
        }
        if(result.hasErrors()) {
            modelMap.addAttribute("branch", branch);
            return "/admin/branch-update";
        }
        branchService.updateBranch(branch, name);
        return "redirect:/admin/list-branch";
    }

    @GetMapping("/branch-delete/{id}")
    public String deleteBranch(@PathVariable Long id) {
        List<Product> products = productRepository.findByBranch_Id(id);
        if(products.isEmpty())
            branchService.deleteBranch(id);
        return "redirect:/admin/list-branch";
    }
}
