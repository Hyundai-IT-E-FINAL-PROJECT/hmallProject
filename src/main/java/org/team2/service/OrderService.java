package org.team2.service;

import org.team2.domain.*;

import java.util.List;
import java.util.Map;

public interface OrderService {
    
    List<OrderVO> packageSelect() throws Exception;

    int insert(OrderVO orderVO) throws Exception;

    void userPointUpdate(UserVO userVO) throws Exception;

    int insertOp(OpVO opVO) throws Exception;

    void confirmOrder(Long order_seq);

    int delete(Long seq) throws Exception;

    void productSellUpdate(ProductVO productVO) throws Exception;

    void deleteUseCoupon(CuVO cuVO) throws Exception;

    List<Map<String, Object>> justanOrderSelect(Long order_seq) throws Exception;

    void pointUse(PointVO pointVO) throws Exception;

    void pointSave(PointVO pointVO) throws Exception;

    void depositUse(DepositVO depositVO) throws Exception;

    void orderCancel(long order_seq, long no) throws Exception;

    void setReply(Long order_seq);
}
