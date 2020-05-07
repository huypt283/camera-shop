package com.nhom8.camera.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Getter
@Setter
@Entity
@Table(name = "brands")
public class ProductBrand extends Base {
    @Column(unique = true, nullable = false, length = 50)
    private String name;
}
