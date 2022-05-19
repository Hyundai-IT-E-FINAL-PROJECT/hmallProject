package org.team2.domain.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum BrandType {
    ADIDAS("아디다스"),
    NIKE("나이키");

    private String description;
}