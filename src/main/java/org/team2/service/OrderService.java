package org.team2.service;

import org.team2.domain.OpVO;
import org.team2.domain.OrderVO;
import org.team2.domain.ProductVO;

import java.util.List;

public interface OrderService {
    List<OrderVO> packageSelect() throws Exception;

    void insert(OrderVO orderVO) throws Exception;

    int delete(Long seq) throws Exception;

}
