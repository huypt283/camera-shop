package com.nhom8.camera.controller;

import com.nhom8.camera.entity.Product;
import com.nhom8.camera.entity.ProductBranch;
import com.nhom8.camera.entity.User;
import com.nhom8.camera.model.request.ChangePasswordRequest;
import com.nhom8.camera.model.request.SearchRequest;
import com.nhom8.camera.model.response.UserResponse;
import com.nhom8.camera.repository.UserRepository;
import com.nhom8.camera.security.CustomUserDetails;
import com.nhom8.camera.service.ProductBranchService;
import com.nhom8.camera.service.ProductService;
import com.nhom8.camera.service.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import javax.validation.Valid;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.function.Predicate;

@Controller
public class AppController {
    private ProductService productService;
    private ProductBranchService productBranchService;
    private UserService userService;
    private UserRepository userRepository;
    private PasswordEncoder passwordEncoder;

    @Autowired
    public AppController(ProductService productService, ProductBranchService productBranchService, UserService userService, UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.productService = productService;
        this.productBranchService = productBranchService;
        this.userService = userService;
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping(value = {"/", "/index"})
    public String index() {
        return "redirect:/home";
    }

    @GetMapping("/login")
    public ModelAndView login(@AuthenticationPrincipal CustomUserDetails userDetails) {
        List<ProductBranch> lstProductBranch = productBranchService.getListProductBranch();
        ModelAndView mav;
        if (userDetails == null) {
            mav = new ModelAndView("/login");
            mav.addObject("lstProductBranch", lstProductBranch);
        } else {
            mav = new ModelAndView("web/direct-message");
            mav.addObject("lstProductBranch", lstProductBranch);
            mav.addObject("message", "Bạn đang đăng nhập");
        }
        return mav;
    }

    @GetMapping("/info")
    public String webInfo(ModelMap modelMap) {
        List<ProductBranch> lstProductBranch = productBranchService.getListProductBranch();
        modelMap.addAttribute("lstProductBranch", lstProductBranch);
        return "/web/info";
    }

    @GetMapping("/contact")
    public String contact(ModelMap modelMap) {
        List<ProductBranch> lstProductBranch = productBranchService.getListProductBranch();
        modelMap.addAttribute("lstProductBranch", lstProductBranch);
        return "web/contact";
    }

    @PostMapping("/search")
    public RedirectView search(@ModelAttribute(value = "searchRequest") SearchRequest searchRequest) {
//        model.addAttribute("query", searchRequest.getSearchValue());

        RedirectView rv = new RedirectView();
        rv.setContextRelative(true);
        rv.setUrl("/search?query=" + searchRequest.getSearchValue());
        return rv;

    }

    @GetMapping("/search")
    public String search(@RequestParam(value = "query", defaultValue = "") String value, @RequestParam(value = "limit", defaultValue = "10") int limit, ModelMap modelMap) {
        List<ProductBranch> lstProductBranch = productBranchService.getListProductBranch();
        modelMap.addAttribute("lstProductBranch", lstProductBranch);
        List<Product> products = productService.search(value, limit, 0);
        if (!products.isEmpty()) {
            modelMap.addAttribute("products", products);
            return "/web/search-result";
        } else {
            modelMap.addAttribute("message", "Không tìm thấy sản phẩm, vui lòng nhập lại");
            return "/web/direct-message";
        }
    }

    @GetMapping("/change-password")
    public ModelAndView changePasswordGet(@ModelAttribute(value = "changepassword") ChangePasswordRequest changePasswordRequest, @AuthenticationPrincipal CustomUserDetails userDetails) {
        ModelAndView mav = new ModelAndView("password-change");
        UserResponse user = userService.findUserById(userDetails.getId());
        mav.addObject("user", user);
        return mav;
    }

    @PostMapping("/change-password")
    public String changePasswordPost(@Valid @ModelAttribute(value = "changepassword") ChangePasswordRequest changePasswordRequest, BindingResult result, ModelMap modelMap, @AuthenticationPrincipal CustomUserDetails userDetails) {
        User user = userRepository.findUserById(userDetails.getId());
        UserResponse userResponse = new UserResponse();
        BeanUtils.copyProperties(user, userResponse);
        if (result.hasErrors()) {
            modelMap.addAttribute("user", userResponse);
            return "password-change";
        }
        if (passwordEncoder.matches(changePasswordRequest.getOldPassword(), user.getPassword())) {
            user.setPassword(passwordEncoder.encode(changePasswordRequest.getPassword()));
            userRepository.save(user);
        } else {
            result.addError(new FieldError("changePasswordRequest", "oldPassword", "Old password wrong"));
            modelMap.addAttribute("user", userResponse);
            return "password-change";
        }
        modelMap.addAttribute("message", "Đổi mật khẩu thành công");

        Set<GrantedAuthority> grantedAuthorities = new HashSet<>(userDetails
                .getAuthorities());

        if (isAdmin(grantedAuthorities)) {
            return "/admin/direct-message";
        } else {
            return "/web/direct-message";
        }

    }

    private boolean isAdmin(Set<GrantedAuthority> grantedAuthorities) {
        Predicate<GrantedAuthority> compare = s -> s.getAuthority().equals("ROLE_ADMIN");
        return grantedAuthorities.stream().anyMatch(compare);
    }
}
