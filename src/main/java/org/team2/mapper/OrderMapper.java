package org.team2.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.team2.domain.OrderVO;

public interface OrderMapper {

    public Integer insert(OrderVO vo);

}
