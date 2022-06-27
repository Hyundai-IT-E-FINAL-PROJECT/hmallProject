package org.team2.domain;

import lombok.Data;

import java.util.Date;

@Data
public class FundParticipantsVO {

    private Long fund_participants_seq;
    private Long fund_product_seq;
    private Long user_seq;
    private Long fund_reward_seq;

    private Long fund_reward_count;
    private Long fund_reward_cost;

    private Date created_at;
    private Date updated_at;

}
