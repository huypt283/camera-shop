package com.nhom8.camera.model.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@NoArgsConstructor @AllArgsConstructor
public class OrderRequest {
    private String shippingAddress;
    private String note;
    private Long totalPrice;
}
