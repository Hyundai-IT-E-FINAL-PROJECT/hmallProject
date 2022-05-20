package org.team2.domain;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class OrderVO {

    private Long seq;//pk
    private Long user_seq;//fk
    private Long point;
    private Long invoice;
    private String status;
    private String userName;
    private String userNumber;
    private String delivery;

    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

}