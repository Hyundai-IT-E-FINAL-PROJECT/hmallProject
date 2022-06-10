package org.team2.service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.team2.domain.*;
import org.team2.mapper.OrderMapper;

import java.util.List;
import java.util.Map;

@Log4j
@Service
public class OrderServiceImpl implements OrderService {

    @Setter(onMethod_=@Autowired)
    private OrderMapper orderMapper;

    @Override
    public List<OrderVO> packageSelect() throws Exception {
        return orderMapper.packageSelect();
    }

    @Transactional
    @Override
    public int insert(OrderVO orderVO) throws Exception {

        //order insert query
        orderMapper.insert(orderVO);
        long order_seq= orderVO.getNo();
        return (int) order_seq;

    }

    @Override
    public void userPointUpdate(UserVO userVO) throws Exception {
        orderMapper.userPointUpdate(userVO);
    }

    @Override
    public int insertOp(OpVO opVO) throws Exception {
        return orderMapper.insertOp(opVO);
    }

    @Override
    public void confirmOrder(Long order_seq) {
        orderMapper.confirmOrder(order_seq);
    }

    @Override
    public int delete(Long seq) throws Exception {
        return orderMapper.delete(seq);
    }

    @Override
    public void productSellUpdate(ProductVO productVO) throws Exception {
        orderMapper.productSellUpdate(productVO);
    }

    @Override
    public void deleteUseCoupon(CuVO cuVO) throws Exception {
        orderMapper.deleteUseCoupon(cuVO);
    }

    @Override
    public List<Map<String, Object>> justanOrderSelect(Long order_seq) throws Exception {
        return orderMapper.justanOrderSelect(order_seq);
    }
}
