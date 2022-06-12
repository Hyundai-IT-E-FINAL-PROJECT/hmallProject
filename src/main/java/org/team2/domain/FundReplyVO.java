package org.team2.domain;

import lombok.Data;

@Data
public class FundReplyVO {
    private long fund_reply_seq;
    private long fund_product_seq;
    private long user_seq;

    private String fund_reply_content;
}
