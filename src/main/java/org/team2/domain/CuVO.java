package org.team2.domain;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class CuVO {

    private Long cu_seq;
    private Long user_seq;
    private Long coupon_seq;
    private Date createdAt;
    private Date updatedAt;

}
