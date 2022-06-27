package org.team2.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ExhibitMapper {
    List<Map<Integer, Object>> euro_exhibit(String exhibit_num) throws Exception;

    List<Map<Integer, Object>> cosmetics(String exhibit_num) throws Exception;

    List<Map<Integer, Object>> hit_product(String exhibit_num) throws Exception;

    List<Map<String, Object>> sort_exhibit(@Param("exhibit_num") String exhibit_num, @Param("sort_value") String sort_value) throws Exception;
}
