package org.team2.domain;

import lombok.Data;

import java.util.Date;

@Data
public class OrderVO {

    private long no;//pk
    private long user_seq;//fk
    private Long point;
    private Long invoice;
    private String status;
    private String userName;
    private String userNumber;
    private String delivery;
    private Long totalCost;
    private String message;
    private String receiveName;
    private String order_method;
    private Long order_coupon_seq;

    private Date createdAt;
    private Date updatedAt;

}