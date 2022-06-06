package org.team2.domain;

import lombok.Data;

@Data
public class OpVO {
    private int op_seq;
    private int order_seq;
    private int product_seq;
    private Long op_count;
}
