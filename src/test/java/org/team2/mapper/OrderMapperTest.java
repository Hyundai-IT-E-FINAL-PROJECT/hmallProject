package org.team2.mapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.team2.domain.OrderVO;

@WebAppConfiguration
@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/applicationContext.xml")
@Log4j
public class OrderMapperTest {

    @Setter(onMethod_ = @Autowired)
    private OrderMapper mapper;

    @Test
    public void testMapper(){
        log.info(mapper);
    }

    //read test 성공
    @Test
    public void testRead(){
        log.info("testRead 시작");
        Long orderSeq=1L;
        OrderVO vo=mapper.readOne(orderSeq);
        log.info(vo);
    }
    //주문 삽입 테스트 성공
    @Test
    public void testInsert(){
        log.info("testInsert 시작");
        OrderVO orderVO=new OrderVO();

        orderVO.setUser_seq(19L);
        orderVO.setStatus("ing");
        orderVO.setUserName("bo");
        orderVO.setUserNumber("0101");
        orderVO.setDelivery("newDe");
        orderVO.setInvoice(3L);
        orderVO.setPoint(20L);

        mapper.insertOne(orderVO);
    }

    @Test
    public void testUpdate(){
        log.info("update 수행중..");
        Long targetSeq=8L;
        OrderVO orderVO=new OrderVO();
        orderVO.setUserNumber("011");
        orderVO.setInvoice(20L);
        orderVO.setDelivery("수정");
        orderVO.setStatus("complete");
        orderVO.setSeq(targetSeq);
        orderVO.setPoint(200L);

        mapper.updateOrder(orderVO);
    }

    @Test
    public void testDelete(){
        Long targetSeq=9L;
        mapper.deleteOne(targetSeq);
    }


}