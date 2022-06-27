package org.team2.domain;

import lombok.Data;

import java.util.Date;

@Data
public class DepositVO {

    private Long deposit_seq;
    private String deposit_content;
    private String deposit_status;
    private Long deposit_cost;
    private Date created_at;
    private Date updated_at;
    private Long user_seq;
    private Long order_seq;
}
