package org.team2.domain;

import lombok.Data;

@Data
public class FundNoticeVO {
    private long fund_notice_seq;
    private long fund_product_seq;
    private long user_seq;

    private String fund_notice_content;
}
