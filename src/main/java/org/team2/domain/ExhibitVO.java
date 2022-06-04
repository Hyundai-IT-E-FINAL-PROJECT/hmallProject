package org.team2.domain;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class ExhibitVO {
    private Long exhibit_seq;
    private Long product_seq;
    private int exhibit_num;
    private Date created_at;
    private Date updated_at;

    private List<ProductVO> productVO;
}
