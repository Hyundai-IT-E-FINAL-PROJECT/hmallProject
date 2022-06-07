package org.team2.service;

import org.team2.domain.*;

import java.util.List;

public interface OrderService {
    List<OrderVO> packageSelect() throws Exception;

    int insert(OrderVO orderVO) throws Exception;

    void userPointUpdate(UserVO userVO) throws Exception;

    int insertOp(OpVO opVO) throws Exception;

    int delete(Long seq) throws Exception;

    void productSellUpdate(ProductVO productVO) throws Exception;

    void deleteUseCoupon(CuVO cuVO) throws Exception;

}
