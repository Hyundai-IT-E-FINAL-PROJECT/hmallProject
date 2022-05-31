package org.team2.domain;

import lombok.Data;

import java.util.Date;

@Data
public class QnAVO {

    private Long qc_seq;
    private Long user_seq;

    private String qc_type;
    private String qc_title;
    private String qc_content;
    private Long qc_phone;
    private String qc_email;


    private Long qc_email_receive;
    private Long order_seq;
    private Long product_code;
    private Long option_code;

    private Date created_at;
    private Date updated_at;

}
