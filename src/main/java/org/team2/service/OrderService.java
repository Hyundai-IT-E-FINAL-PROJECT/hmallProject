package org.team2.service;

import org.team2.domain.OrderVO;
import org.team2.domain.ProductVO;

import java.util.List;

public interface OrderService {
    List<OrderVO> packageSelect() throws Exception;

    int insert(OrderVO orderVO, ProductVO productVO) throws Exception;

    int delete(Long seq) throws Exception;

}
