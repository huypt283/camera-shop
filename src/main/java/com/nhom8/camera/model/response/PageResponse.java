package com.nhom8.camera.model.response;

import com.nhom8.camera.entity.Product;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter @Setter
@AllArgsConstructor
@NoArgsConstructor
public class PageResponse {
    private int page;
    private int limit;
    private List<Product> productList;
    private int totalItem;
    private  int totalPage;
    private String url;
}
