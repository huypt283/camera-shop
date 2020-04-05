//package com.nhom8.camera.entity;
//
//import lombok.Getter;
//import lombok.Setter;
//import org.hibernate.annotations.CreationTimestamp;
//
//import javax.persistence.*;
//import java.util.Date;
//
//@Getter
//@Setter
//@Entity
//@Table(name = "discounts")
//public class Discount extends Base {
//    @Column
//    private Date startTime;
//
//    @Column
//    private Date endTime;
//
//    @Column
//    private int discountValue;
//
//    @Column
//    private float maxDiscount;
//
//    @CreationTimestamp
//    @Temporal(TemporalType.TIMESTAMP)
//    @Column
//    private Date createDate;
//
//    @ManyToOne(fetch = FetchType.LAZY)
//    private User createBy;
//
//    @Column
//    private int limited;
//}
