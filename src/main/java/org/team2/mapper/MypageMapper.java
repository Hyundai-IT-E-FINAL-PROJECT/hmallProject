package org.team2.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface MypageMapper {
    List<Map<String,Object>> recentOrders(long no) throws Exception;

    List<Map<String, Object>> periodOrders(@Param("no") long no, @Param("startDateStr") String startDateStr, @Param("endDateStr") String endDateStr, @Param("period") String period) throws Exception;
}
