package com.nhom8.camera.model.request;

import lombok.*;

@Getter @Setter
@NoArgsConstructor @AllArgsConstructor
public class LineItemRequest {
    private Long productId;
    private Long unitPrice;
    private int quantity;
}
