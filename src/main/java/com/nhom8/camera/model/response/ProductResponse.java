package com.nhom8.camera.model.response;

import lombok.*;

@Getter @Setter
@AllArgsConstructor
@NoArgsConstructor
public class ProductResponse {
    private String name;
    private Long unitPrice;
    private int quantity;

}
