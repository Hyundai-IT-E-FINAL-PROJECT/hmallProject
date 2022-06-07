package org.team2.service;

import org.team2.domain.DepositVO;

import java.util.List;
import java.util.Map;

public interface MypageService {
    Map recentOrders(long no) throws Exception;

    Map periodOrders(long no, String ordStrtDt, String ordEndDt, String seType, String itemNm) throws Exception;

    Map detailOrders(long no, long odno) throws Exception;

    Map couponList(long no)  throws Exception;

    List<Map<String, Object>> pointList(String no, String strtDt, String endDt, String searchType) throws Exception;

    List<Map<String, Object>> cancelperiodOrders(String no, String ordStrtDt, String ordEndDt, String seType, String itemNm, String type) throws Exception;

    List<DepositVO> depositList(String no, String strtDt, String endDt, String searchType) throws Exception;

    int niknameCheck(String nknm) throws Exception;

    int checkUpdate(String emaailval, String smsval, String genderval, String userid) throws Exception;
}
