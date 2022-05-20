package org.team2.domain.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum CategoryLargeType {
    SKIRT("스커트"),
    JEAN("바지");

    private String description;
}