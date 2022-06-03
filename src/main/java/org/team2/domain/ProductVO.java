package org.team2.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.team2.domain.enums.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

@Data
public class ProductVO {

    // pk
    private Long product_seq;

    // fk
    private Long category_seq;

    // general
    private Long product_code;
    private String product_name;
    private String product_info;
    private String product_detail;
    private BrandType product_brand;
    private ManufactureType product_manufacture;
    private CountryType product_country;
    private Long product_count;
    private Long product_cost;
    private Long discounted_cost;

    // date
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
    private Date created_at;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
    private Date updated_at;
}
