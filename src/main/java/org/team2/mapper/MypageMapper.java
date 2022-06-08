package org.team2.mapper;

import org.apache.ibatis.annotations.Param;
import org.team2.domain.DepositVO;

import java.util.List;
import java.util.Map;

public interface MypageMapper {
    void recentOrders(Map<String,Object> map) throws Exception;

    void periodOrders(Map<String,Object> map) throws Exception;

    void detailOrders(Map<String,Object> map) throws Exception;

    void couponList(Map<String,Object> map) throws Exception;

    List<Map<String, Object>> pointList(@Param("no") String no,
                                        @Param("strtDt") String strtDt,
                                        @Param("endDt")  String endDt,
                                        @Param("searchType") String searchType) throws Exception;

    List<Map<String, Object>> cancelperiodOrders(@Param("no") String no,
                                                 @Param("ordStrtDt") String ordStrtDt,
                                                 @Param("ordEndDt") String ordEndDt,
                                                 @Param("seType") String seType,
                                                 @Param("itemNm") String itemNm,
                                                 @Param("type") String type) throws Exception;

    List<DepositVO> depositList(@Param("no") String no,
                                @Param("strtDt") String strtDt,
                                @Param("endDt")  String endDt,
                                @Param("searchType") String searchType) throws Exception;

    int niknameCheck(String nknm) throws Exception;

    void DropUser(int no) throws Exception;
}
