package com.nhom8.camera.service.impl;

import com.nhom8.camera.entity.Product;
import com.nhom8.camera.entity.ProductBranch;
import com.nhom8.camera.model.request.OffsetBasedPageRequest;
import com.nhom8.camera.repository.ProductBranchRepository;
import com.nhom8.camera.service.ProductBranchService;
import com.nhom8.camera.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductBranchServiceImpl implements ProductBranchService {
   private ProductBranchRepository productBranchRepository;

   @Autowired
   public ProductBranchServiceImpl(ProductBranchRepository productBranchRepository){this.productBranchRepository=productBranchRepository;}


    @Override
    public List<ProductBranch> getListProductBranch(int limit, int offset) {
        OffsetBasedPageRequest pageable = new OffsetBasedPageRequest(offset, limit, Sort.by("id").descending());
        List<ProductBranch> lstProductBranch = productBranchRepository.findAllAndSort(pageable);
        return lstProductBranch;
    }
}
