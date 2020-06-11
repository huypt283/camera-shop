package com.nhom8.camera.service.impl;

import com.nhom8.camera.entity.LineItem;
import com.nhom8.camera.entity.Product;
import com.nhom8.camera.repository.LineItemRepository;
import com.nhom8.camera.service.LineItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class LineItemServiceImpl implements LineItemService {
    private LineItemRepository lineItemRepository;

    @Autowired
    public LineItemServiceImpl(LineItemRepository lineItemRepository) {
        this.lineItemRepository = lineItemRepository;
    }

    @Override
    public void saveLineItem(LineItem lineItem) {
        lineItemRepository.save(lineItem);
    }

    @Override
    public void saveAllLineItem(List<LineItem> lineItems) {
        try {
            lineItemRepository.saveAll(lineItems);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<LineItem> findByProduct(Product product) {
        return lineItemRepository.findByProduct(product);
    }
}
