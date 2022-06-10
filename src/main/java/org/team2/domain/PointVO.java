package org.team2.domain;

import lombok.Data;

import java.util.Date;

@Data
public class PointVO {

    private Long point_seq;
    private Long point_cost;
    private Long user_seq;
    private Long order_seq;

    private Date created_at;
    private Date updated_at;
}
