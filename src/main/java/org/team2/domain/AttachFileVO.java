package org.team2.domain;

import lombok.Data;

@Data
public class AttachFileVO {
    private int fund_file_seq;
    private String fileName;
    private String uploadPath;
    private String uuid;
    private int fund_product_seq;
}
