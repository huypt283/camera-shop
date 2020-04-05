package com.nhom8.camera.model.request;

import com.nhom8.camera.util.validation.ValidProductName;
import com.nhom8.camera.util.validation.ValidQuantity;
import com.nhom8.camera.util.validation.ValidUnitPrice;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.Size;

@Validated
@Getter @Setter
@NoArgsConstructor @AllArgsConstructor
public class CreateProductRequest {
    @Size(min = 2, max = 100, message = "Must be between 2 and 100 characters")
    @ValidProductName
    private String name;

    @ValidUnitPrice
    private String unitPrice;

    @ValidQuantity
    private String quantity;

    private MultipartFile productImage;

    private Long branchId;
}