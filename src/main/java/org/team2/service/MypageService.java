package org.team2.service;

import org.team2.domain.DepositVO;

import java.util.List;
import java.util.Map;

public interface MypageService {
    List<Map<String,Object>>  recentOrders(String no) throws Exception;

    List<Map<String, Object>> periodOrders(String no, String ordStrtDt, String ordEndDt, String seType, String itemNm)throws Exception;

    List<Map<String, Object>> detailOrders(String no, long odno) throws Exception;

    List<Map<String, Object>> couponList(String no)  throws Exception;

    List<Map<String, Object>> pointList(String no, String strtDt, String endDt, String searchType) throws Exception;

    List<Map<String, Object>> cancelperiodOrders(String no, String ordStrtDt, String ordEndDt, String seType, String itemNm, String type) throws Exception;

    List<DepositVO> depositList(String no, String strtDt, String endDt, String searchType) throws Exception;
}
