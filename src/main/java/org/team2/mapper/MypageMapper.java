package org.team2.mapper;

import java.util.List;
import java.util.Map;

public interface MypageMapper {
    List<Map<String,Object>> recentOrders(long no) throws Exception;
}
