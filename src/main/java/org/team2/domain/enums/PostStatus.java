package org.team2.domain.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum PostStatus {
    GOOD("빨라요"),
    NORMAL("보통이에요"),
    BAD("늦어요");


    private String description;
}
