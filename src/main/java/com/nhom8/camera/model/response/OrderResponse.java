package com.nhom8.camera.model.response;

import com.nhom8.camera.entity.LineItem;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;
import java.util.Date;

@Getter @Setter
@NoArgsConstructor @AllArgsConstructor
public class OrderResponse {
    private Long id;

    private String userName;

    private Date orderDate;

    private String note;

    private String shippingAddress;

    private Long totalPrice;

    private List<LineItem> itemList;
}
