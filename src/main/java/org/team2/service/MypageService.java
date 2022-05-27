package org.team2.service;

import java.util.List;
import java.util.Map;

public interface MypageService {
    List<Map<String,Object>>  recentOrders(long no) throws Exception;

//
//    List<Map<String, Object>> periodOrders(long no) throws Exception;

    List<Map<String, Object>> periodOrders(long no, String startDateStr, String endDateStr, String period)throws Exception;
}
