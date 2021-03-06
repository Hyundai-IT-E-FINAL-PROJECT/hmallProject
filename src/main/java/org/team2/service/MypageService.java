package org.team2.service;

import org.team2.domain.DepositVO;

import java.util.List;
import java.util.Map;

public interface MypageService {
    Map recentOrders(long no) throws Exception;

    Map periodOrders(long no, String ordStrtDt, String ordEndDt, String seType, String itemNm) throws Exception;

    Map adminPeriodOrders(String ordStrtDt, String ordEndDt, String seType, String itemNm, long page_num) throws Exception;

    Map detailOrders(long no, long odno) throws Exception;

    Map couponList(long no)  throws Exception;

    Map pointList(long no, String strtDt, String endDt, String searchType) throws Exception;

    List<Map<String, Object>> cancelperiodOrders(String no, String ordStrtDt, String ordEndDt, String seType, String itemNm) throws Exception;

    List<DepositVO> depositList(String no, String strtDt, String endDt, String searchType) throws Exception;

    int niknameCheck(String nknm) throws Exception;

    int checkUpdate(String emaailval, String smsval, String genderval, String userid) throws Exception;

    Map deliveryList(long no) throws Exception;

    Map orderStatus(long no) throws Exception;

    void DropUser(int no) throws Exception;

    int deleteDelivery(long adno) throws Exception;

    void baseDelivery(long adno) throws Exception;

    Map adminOrderStatus() throws Exception;
}
