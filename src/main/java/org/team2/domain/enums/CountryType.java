package org.team2.domain.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum CountryType {
    KOREA("한국"),
    JAPAN("일본");

    private String description;
}