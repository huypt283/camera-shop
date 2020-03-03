package com.nhom8.camera.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Getter
@Setter
@Entity
@Table(name = "branchs")
public class ProductBranch extends Base {
    @Column(unique = true, nullable = false)
    private String name;
}
