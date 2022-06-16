package org.team2.domain;

import lombok.Data;

@Data
public class ReplyVO {
    //pk
    private Long reply_seq;

    //fk
    private Long user_seq;
    private Long product_seq;

    private String reply_package;
    private String reply_post;
    private String reply_satis;
}
