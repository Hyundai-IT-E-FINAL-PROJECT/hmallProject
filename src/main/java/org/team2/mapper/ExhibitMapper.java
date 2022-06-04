package org.team2.mapper;

import java.util.List;
import java.util.Map;

public interface ExhibitMapper {
    List<Map<Integer, Object>> euro_exhibit(String exhibit_num) throws Exception;
}
