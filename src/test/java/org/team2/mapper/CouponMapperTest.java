package org.team2.mapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.team2.domain.CouponVO;
import org.team2.domain.OrderVO;

@WebAppConfiguration
@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/applicationContext.xml")
@Log4j
public class CouponMapperTest {

    @Setter(onMethod_ = @Autowired)
    private CouponMapper mapper;

    @Test
    public void testRead() throws Exception {
        log.info("testRead 시작");
        Long userSeq=41L;
        CouponVO list= (CouponVO) mapper.getCouponList(userSeq);
        log.info(list);
    }
}
