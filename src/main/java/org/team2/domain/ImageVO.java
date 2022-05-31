package org.team2.domain;

import lombok.Data;

@Data
public class ImageVO {
    //pk
    private Long image_seq;

    //fk
    private Long product_seq;

    private String image_name;
    private String image_type;
}
