package org.team2.domain.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum ManufactureType {
    MANU1("제조사1"),
    MANU2("제조사2");

    private String description;
}