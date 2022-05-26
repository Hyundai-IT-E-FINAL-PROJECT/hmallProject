package org.team2.service;

import org.team2.domain.OrderVO;

import java.util.List;

public interface OrderService {
    List<OrderVO> packageSelect() throws Exception;

    int insert(OrderVO vo) throws Exception;

    int delete(Long seq) throws Exception;

}
