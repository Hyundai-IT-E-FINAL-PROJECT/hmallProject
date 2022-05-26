package org.team2.mapper;

import org.team2.domain.OrderVO;

import java.util.List;

public interface OrderMapper {

    int insert(OrderVO vo);

    OrderVO readOne(Long seq);

    int updateOrder(OrderVO vo);

    int delete(Long seq);

    //pl/sql 적용
    List<OrderVO> packageSelect();
}