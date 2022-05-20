package org.team2.mapper;

import org.team2.domain.OrderVO;

public interface OrderMapper {

    int insertOne(OrderVO vo);

    OrderVO readOne(Long seq);

    int updateOrder(OrderVO vo);

    int deleteOne(Long seq);
}