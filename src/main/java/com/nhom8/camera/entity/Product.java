package com.nhom8.camera.entity;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.util.Date;

@Getter
@Setter
@Entity
@Table(name = "products")
public class Product extends Base {
    @ManyToOne
    private ProductBrand brand;

    @Column(length = 100, nullable = false, unique = true)
    private String name;

    @Column
    private Long unitPrice;

    @CreationTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    @Column
    private Date createDate;

    @UpdateTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    @Column
    private Date updateDate;

    @Column(length = 100)
    private String createBy;

    @Column(length = 100)
    private String updateBy;

    @Column
    private int quantity;

    @Column
    @Type(type = "text")
    private String productImage;
}
