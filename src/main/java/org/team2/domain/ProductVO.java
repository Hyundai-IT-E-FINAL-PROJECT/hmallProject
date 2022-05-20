package org.team2.domain;

import lombok.Data;
import org.team2.domain.enums.*;

import java.time.LocalDateTime;

@Data
public class ProductVO {

    // pk
    private Long seq;

    // fk
    private Long op1_seq1;
    private Long op1_seq2;
    private Long op1_seq3;
    private Long op1_seq4;
    private Long op1_seq5;

    // general
    private Long productCode;
    private String productName;
    private String productInfo;
    private String productDetail;
    private BrandType productBrand;
    private ManufactureType productManufacture;
    private CountryType productCountry;
    private Long productCount;
    private CategoryLargeType productLarge;
    private CategorySmallType productSmall;

    // date
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
