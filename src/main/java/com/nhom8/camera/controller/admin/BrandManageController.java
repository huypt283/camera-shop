package com.nhom8.camera.controller.admin;

import com.nhom8.camera.entity.ProductBrand;
import com.nhom8.camera.model.request.BrandRequest;
import com.nhom8.camera.repository.BrandRepository;
import com.nhom8.camera.service.BrandService;
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
public class BrandManageController {
    private final int limit = 10;

    private BrandService brandService;
    private BrandRepository brandRepository;

    @Autowired
    public BrandManageController(BrandService brandService, BrandRepository brandRepository) {
        this.brandService = brandService;
        this.brandRepository = brandRepository;
    }

    @GetMapping("/list-brand")
    public ModelAndView listBrand(@RequestParam(value = "page", defaultValue = "1") int page) {
        ModelAndView mav = new ModelAndView("/admin/brand-table");
        int offset = (page-1)*limit;
        List<ProductBrand> branches = brandService.getListBranch(limit, offset);
        long totalPage = brandRepository.count()/limit + 1;
        mav.addObject("totalPage", totalPage);
        mav.addObject("branches", branches);
        return mav;
    }

    @GetMapping("/brand")
    public ModelAndView createBrandGet(@ModelAttribute(value = "branchRequest") BrandRequest brandRequest) {
        return new ModelAndView("/admin/brand-create");
    }

    @PostMapping("/brand")
    public String createBrandPost(@Valid @ModelAttribute(value = "brandRequest") BrandRequest brandRequest, BindingResult result) {
        String name = brandRequest.getName();
        ProductBrand branch = brandRepository.findByName(name);
        if (branch != null) {
            result.addError(new FieldError("brandRequest", "name", "Branch name already exist"));
        }
        if(result.hasErrors()) {
            return "/admin/brand-create";
        }
        brandService.createBranch(name);
        return "redirect:/admin/list-brand";
    }

    @GetMapping("/brand/{id}")
    public ModelAndView updateBrandGet(@PathVariable(value = "id") final Long id, @ModelAttribute(value = "branchRequest") BrandRequest brandRequest) {
        ModelAndView mav = new ModelAndView("/admin/brand-update");
        ProductBrand branch = brandService.getBranchById(id);
        mav.addObject("branch", branch);
        return mav;
    }

    @PostMapping("/brand/{id}")
    public String updateBrandGet(@PathVariable(value = "id") final Long id, @Valid @ModelAttribute(value = "branchRequest") BrandRequest brandRequest, BindingResult result, ModelMap modelMap) {
        String name = brandRequest.getName();
        ProductBrand branch = brandService.getBranchById(id);
        if (branch.getName().equals(name)) {
            result.addError(new FieldError("branchRequest", "name", "Branch name already exist"));
        }
        if(result.hasErrors()) {
            modelMap.addAttribute("branch", branch);
            return "/admin/brand-update";
        }
        brandService.updateBranch(branch, name);
        return "redirect:/admin/list-brand";
    }

    @GetMapping("/brand-delete/{id}")
    public String deleteBrand(@PathVariable Long id) {
        brandService.deleteBranch(id);
        return "redirect:/admin/list-brand";
    }
}
