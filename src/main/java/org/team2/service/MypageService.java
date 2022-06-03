package org.team2.service;

import java.util.List;
import java.util.Map;

public interface MypageService {
    List<Map<String,Object>>  recentOrders(String no) throws Exception;

    List<Map<String, Object>> periodOrders(String no, String ordStrtDt, String ordEndDt, String seType, String itemNm)throws Exception;

    List<Map<String, Object>> detailOrders(String no, long odno) throws Exception;

    List<Map<String, Object>> couponList(String no)  throws Exception;
}
