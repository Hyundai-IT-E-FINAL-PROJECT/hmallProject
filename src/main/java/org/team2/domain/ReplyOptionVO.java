package org.team2.domain;

import lombok.Data;

@Data
public class ReplyOptionVO {
    private Long user_seq;
    private Long product_seq;
    private Long star;
    private String reply_package;
    private String reply_post;
    private String reply_satis;
}
