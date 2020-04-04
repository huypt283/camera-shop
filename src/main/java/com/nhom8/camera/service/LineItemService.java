package com.nhom8.camera.service;

import com.nhom8.camera.entity.LineItem;

import java.util.List;

public interface LineItemService {
    void saveLineItem(LineItem lineItem);
    void saveAllLineItem(List<LineItem> lineItems);
}
