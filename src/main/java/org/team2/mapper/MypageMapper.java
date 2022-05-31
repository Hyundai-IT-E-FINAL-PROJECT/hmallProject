package org.team2.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface MypageMapper {
    List<Map<String,Object>> recentOrders(long no) throws Exception;

    List<Map<String, Object>> periodOrders(@Param("no") long no,
                                           @Param("ordStrtDt") String ordStrtDt,
                                           @Param("ordEndDt") String ordEndDt,
                                           @Param("seType") String seType,
                                           @Param("itemNm") String itemNm) throws Exception;

    List<Map<String, Object>> detailOrders(@Param("no") long no, @Param("odno") long odno) throws Exception;

    List<Map<String, Object>> couponList(long no) throws Exception;
}
