package org.team2.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class FundReplyVO {
    private long fund_reply_seq;
    private long fund_product_seq;
    private long user_seq;

    private String fund_reply_content;
}
