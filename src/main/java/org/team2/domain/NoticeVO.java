package org.team2.domain;

import lombok.Data;

import java.util.Date;

@Data
public class NoticeVO {

    private Long notice_seq;
    private String notice_title;
    private String notice_content;

    private Date created_at;
    private Date updated_at;

}
