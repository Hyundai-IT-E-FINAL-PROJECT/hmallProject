package org.team2.domain;

import lombok.Data;

import java.util.Date;

@Data
public class RewardVO {

    //pk
    private long fund_reward_seq;

    //fk
    private long fund_product_seq;


    private String fund_reward_title;
    private String fund_reward_content;
    private String fund_reward_count;

}
