package org.team2.service;

import java.util.List;
import java.util.Map;

public interface ExhibitService {
    List<Map<Integer, Object>> euro_exhibit(String exhibit_num) throws  Exception;
}
