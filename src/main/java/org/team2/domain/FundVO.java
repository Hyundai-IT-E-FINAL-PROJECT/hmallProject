package org.team2.domain;

import lombok.Data;

import java.util.Date;

@Data
public class FundVO {
    //pk
    private Long fund_product_seq;

    //fk
    private int no;

    private String fund_product_start_date;
    private String fund_product_end_date;
    private int fund_product_goal_cost;
    private int fund_product_pr_cost;
    private String fund_product_title;
    private String fund_product_content;
    private int fund_product_status;
    private int fund_product_participants;
    private String fund_product_main_img;

    //sysdate
    private String created_at;
    private String updated_at;
}
