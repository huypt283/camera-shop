package com.nhom8.camera.model.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.validation.annotation.Validated;

import javax.validation.constraints.Size;

@Validated
@Getter @Setter
@NoArgsConstructor @AllArgsConstructor
public class BranchRequest {
    @Size(min = 2, max = 50, message = "Must be between 2 and 50 characters")
    private String name;
}
