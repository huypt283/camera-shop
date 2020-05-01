package com.nhom8.camera.model.request;

import com.nhom8.camera.util.validation.ValidOrderStatus;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.validation.annotation.Validated;

@Validated
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UpdateOrderAdminRequest {
    @ValidOrderStatus
    private String status;
}
