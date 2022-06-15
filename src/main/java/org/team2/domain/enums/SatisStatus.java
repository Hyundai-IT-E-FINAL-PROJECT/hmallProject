package org.team2.domain.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum SatisStatus {
    GOOD("만족해요"),
    NORMAL("보통이에요"),
    BAD("별로예요");


    private String description;
}
