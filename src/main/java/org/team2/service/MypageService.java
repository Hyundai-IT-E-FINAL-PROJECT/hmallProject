package org.team2.service;

import java.util.List;
import java.util.Map;

public interface MypageService {
    List<Map<String,Object>>  recentOrders(long no) throws Exception;

//
//    List<Map<String, Object>> periodOrders(long no) throws Exception;

    List<Map<String, Object>> periodOrders(long no, String ordStrtDt, String ordEndDt, String seType, String itemNm)throws Exception;
}
