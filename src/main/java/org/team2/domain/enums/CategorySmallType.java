package org.team2.domain.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum CategorySmallType {
    BLUEJEANS("청바지"),
    COTTONJEANS("빨간바지");

    private String description;
}