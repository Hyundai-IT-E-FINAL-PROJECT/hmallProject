package org.team2.domain;

import lombok.Data;

@Data
public class CategoryVO {
    // pk
    private Long category_seq;

    // fk
    private Long category_ref;

    // general
    private String category_name;
}
