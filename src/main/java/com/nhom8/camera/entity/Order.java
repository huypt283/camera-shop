package com.nhom8.camera.entity;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.springframework.data.annotation.CreatedDate;

import javax.persistence.*;
import java.util.Date;

@Getter
@Setter
@Entity
@Table(name = "orders")
public class Order extends Base{
    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    private User user;

    @CreatedDate
    @Temporal(TemporalType.TIMESTAMP)
    private Date orderDate;

    @Column
    private String note;

    @Column(length = 100)
    private String shippingAddress;

    @Column
    private String status;

    @Column
    private Long totalPrice;
}
