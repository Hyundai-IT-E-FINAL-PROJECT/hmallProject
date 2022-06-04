package org.team2.mapper;

import org.apache.ibatis.annotations.Param;
import org.team2.domain.DepositVO;

import java.util.List;
import java.util.Map;

public interface MypageMapper {
    List<Map<String,Object>> recentOrders(String no) throws Exception;

    List<Map<String, Object>> periodOrders(@Param("no") String no,
                                           @Param("ordStrtDt") String ordStrtDt,
                                           @Param("ordEndDt") String ordEndDt,
                                           @Param("seType") String seType,
                                           @Param("itemNm") String itemNm) throws Exception;

    List<Map<String, Object>> detailOrders(@Param("no") String no, @Param("odno") long odno) throws Exception;

    List<Map<String, Object>> couponList(String no) throws Exception;

    List<Map<String, Object>> pointList(@Param("no") String no,
                                        @Param("strtDt") String strtDt,
                                        @Param("endDt")  String endDt,
                                        @Param("searchType") String searchType) throws Exception;

    List<Map<String, Object>> returnperiodOrders(@Param("no") String no,
                                                 @Param("ordStrtDt") String ordStrtDt,
                                                 @Param("ordEndDt") String ordEndDt,
                                                 @Param("seType") String seType,
                                                 @Param("itemNm") String itemNm,
                                                 @Param("type") String type) throws Exception;

    List<DepositVO> depositList(@Param("no") String no,
                                @Param("strtDt") String strtDt,
                                @Param("endDt")  String endDt,
                                @Param("searchType") String searchType) throws Exception;
}
