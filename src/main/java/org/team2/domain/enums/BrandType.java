package org.team2.domain.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum BrandType {
    ADIDAS("아디다스"),
    NIKE("나이키"),
    EURO_COL("유로컬렉션"),
    EURO("유로"),
    LIOBELL("리오벨"),
    WHITENING("미백순수");

    private String description;
}