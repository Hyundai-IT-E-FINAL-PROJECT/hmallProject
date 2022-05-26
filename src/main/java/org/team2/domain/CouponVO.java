package org.team2.domain;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class CouponVO {

    private Long coupon_seq;
    private Long user_seq;
    private String coupon_name;
    private Long coupon_ratio;
    private Long coupon_cost;

    private Date createdAt;
    private Date updatedAt;
    private Date expired_at;

    private List<CuVO> cuList;

}
