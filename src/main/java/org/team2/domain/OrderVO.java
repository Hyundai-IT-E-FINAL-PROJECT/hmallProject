package org.team2.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderVO {

    private Integer orderSeq, point, userSeq, invoice;
    private String status, userName, userNumber, delivery;
    private Date createAt, updatedAt;


}
