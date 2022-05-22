package org.team2.domain;

import lombok.Data;
import org.team2.domain.enums.*;

import java.time.LocalDateTime;

@Data
public class ProductVO {

    // pk
    private Long product_seq;

    // fk
    private Long op2_seq1;
    private Long op2_seq2;
    private Long op2_seq3;
    private Long op2_seq4;
    private Long op2_seq5;

    // general
    private Long product_code;
    private String product_name;
    private String product_info;
    private String product_detail;
    private BrandType product_brand;
    private ManufactureType product_manufacture;
    private CountryType product_country;
    private Long product_count;
    private CategoryLargeType product_large;
    private CategorySmallType product_small;

    // date
    private LocalDateTime created_at;
    private LocalDateTime updated_at;
}
