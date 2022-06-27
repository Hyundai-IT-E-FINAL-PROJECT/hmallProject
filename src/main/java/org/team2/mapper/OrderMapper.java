package org.team2.mapper;

import org.apache.ibatis.annotations.Param;
import org.team2.domain.*;

import java.util.List;
import java.util.Map;

public interface OrderMapper {

    //int insert(@Param("OrderVO") OrderVO orderVO) throws Exception;
    int insert(OrderVO orderVO) throws Exception;

    void setReply(Long order_seq);

    OrderVO readOne(Long seq);

    void confirmOrder(@Param("order_seq") Long order_seq);

   // int insertOp(@Param("OrderVO") OrderVO orderVO, @Param("ProductVO") ProductVO productVO, @Param("OpVO") OpVO opVO) throws Exception;

    int delete(Long seq);

    //pl/sql 적용
    List<OrderVO> packageSelect();

    int insertOp(OpVO productVO) throws Exception;

    void userPointUpdate(UserVO userVO) throws Exception;

    void productSellUpdate(ProductVO productVO) throws Exception;

    void deleteUseCoupon(CuVO cuVO) throws Exception;

    List<Map<String, Object>> justanOrderSelect(Long order_seq) throws Exception;

    void pointUse(PointVO pointVO) throws Exception;

    void pointSave(PointVO pointVO) throws Exception;

    void depositUse(DepositVO depositVO) throws Exception;

    void orderCancel(@Param("order_seq") long order_seq, @Param("no") long no) throws Exception;
}