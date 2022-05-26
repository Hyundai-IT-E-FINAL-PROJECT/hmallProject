package org.team2.service;

import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team2.domain.OrderVO;
import org.team2.mapper.OrderMapper;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Setter(onMethod_=@Autowired)
    private OrderMapper orderMapper;

    @Override
    public List<OrderVO> packageSelect() throws Exception {
        return orderMapper.packageSelect();
    }

    @Override
    public int insert(OrderVO vo) throws Exception {
        return orderMapper.insert(vo);
    }

    @Override
    public int delete(Long seq) throws Exception {
        return orderMapper.delete(seq);
    }


}
