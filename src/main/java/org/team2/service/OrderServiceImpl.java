package org.team2.service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.team2.domain.OpVO;
import org.team2.domain.OrderVO;
import org.team2.domain.ProductVO;
import org.team2.mapper.OrderMapper;

import java.util.List;
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
    public void insert(OrderVO orderVO) throws Exception {

        //order insert query
        orderMapper.insert(orderVO);
//        int order_seq=orderVO.getOrder_seq();
//        log.info(order_seq);
//        return order_seq;
        //log.info("ServiceImpl:"+orderVO.toString());

//        int order_seq=orderVO.getOrder_seq();
//        log.info("created order_seq: "+order_seq);
//
//        // op insert query using order_seq
//        opVO.setOrder_seq(order_seq);
//        orderMapper.insertOp(orderVO, productVO, opVO);
//
//
//        int op_seq= Math.toIntExact(opVO.getOp_seq());
//        log.info("created op_seq"+op_seq);
//
//        //return op_seq value
//        return Math.toIntExact(op_seq);


    }



//    @Override
//    public int insert(OrderVO vo) throws Exception {
//        return orderMapper.insert(vo);
//    }

    @Override
    public int delete(Long seq) throws Exception {
        return orderMapper.delete(seq);
    }


}
