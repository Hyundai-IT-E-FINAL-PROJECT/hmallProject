package org.team2.service;

import java.util.List;
import java.util.Map;

public interface ExhibitService {
    List<Map<Integer, Object>> euro_exhibit(String exhibit_num) throws  Exception;

    List<Map<Integer, Object>> cosmetics(String exhibit_num) throws Exception;

    List<Map<Integer, Object>> hit_product(String exhibit_num) throws Exception;

    List<Map<String, Object>> sort_exhibit(String exhibit_num, String sort_value) throws Exception;
}
