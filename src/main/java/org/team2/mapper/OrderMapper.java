package org.team2.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.security.core.parameters.P;
import org.team2.domain.OpVO;
import org.team2.domain.OrderVO;
import org.team2.domain.ProductVO;

import java.util.List;

public interface OrderMapper {

    int insert(@Param("OrderVO") OrderVO orderVO) throws Exception;



    OrderVO readOne(Long seq);

    int updateOrder(OrderVO vo);

    int insertOp(@Param("OrderVO") OrderVO orderVO, @Param("ProductVO") ProductVO productVO, @Param("OpVO") OpVO opVO) throws Exception;

    int delete(Long seq);

    //pl/sql 적용
    List<OrderVO> packageSelect();
}