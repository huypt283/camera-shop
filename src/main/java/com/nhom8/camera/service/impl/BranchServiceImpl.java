package com.nhom8.camera.service.impl;

import com.nhom8.camera.entity.ProductBranch;
import com.nhom8.camera.model.request.OffsetBasedPageRequest;
import com.nhom8.camera.repository.BranchRepository;
import com.nhom8.camera.service.BranchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BranchServiceImpl implements BranchService {
    private BranchRepository branchRepository;

    @Autowired
    public BranchServiceImpl(BranchRepository branchRepository) {
        this.branchRepository = branchRepository;
    }

    @Override
    public List<ProductBranch> getListBranch() {
        return branchRepository.findAll();
    }

    @Override
    public List<ProductBranch> getListBranch(int limit, int offset) {
        OffsetBasedPageRequest pageable = new OffsetBasedPageRequest(offset, limit, Sort.by("id").ascending());
        return branchRepository.findListBranch(pageable);
    }

    @Override
    public ProductBranch getBranchById(Long id) {
        return branchRepository.findOneById(id);
    }

    @Override
    public void createBranch(String name) {
        ProductBranch branch = new ProductBranch();
        branch.setName(name);
        branchRepository.save(branch);
    }

    @Override
    public void updateBranch(ProductBranch branch, String name) {
        branch.setName(name);
        branchRepository.save(branch);
    }

    @Override
    public void deleteBranch(Long id) {
        branchRepository.deleteById(id);
    }

}
