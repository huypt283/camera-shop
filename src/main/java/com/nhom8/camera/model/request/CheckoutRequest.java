package com.nhom8.camera.model.request;

import lombok.*;

import java.util.List;

@Getter @Setter
@NoArgsConstructor @AllArgsConstructor
public class CheckoutRequest {
    private OrderRequest orderRequest;
    private List<LineItemRequest> lineItemRequests;
}
