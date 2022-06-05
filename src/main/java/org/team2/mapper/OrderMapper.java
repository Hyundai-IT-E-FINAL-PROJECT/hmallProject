package org.team2.mapper;

import org.apache.ibatis.annotations.Param;
import org.team2.domain.OrderVO;
import org.team2.domain.ProductVO;

import java.util.List;

public interface OrderMapper {

    int insert(@Param("OrderVO") OrderVO orderVO, @Param("ProductVO") ProductVO productVO) throws Exception;

    OrderVO readOne(Long seq);

    int updateOrder(OrderVO vo);

    int delete(Long seq);

    //pl/sql 적용
    List<OrderVO> packageSelect();
}