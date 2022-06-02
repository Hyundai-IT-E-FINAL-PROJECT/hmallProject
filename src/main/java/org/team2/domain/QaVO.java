package org.team2.domain;

import lombok.Data;

import java.util.Date;

@Data
public class QaVO {
    private Long qa_seq;
    private Long qc_seq;
    private Long user_seq;

    private String qa_content;

    private Date r_created_at;
    private Date r_updated_at;
}
