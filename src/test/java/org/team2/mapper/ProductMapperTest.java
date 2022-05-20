package org.team2.mapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.team2.domain.ProductVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/applicationContext.xml")
@Log4j
public class ProductMapperTest {
    @Setter(onMethod_ = @Autowired)
    private ProductMapper mapper;

    @Test
    public void testMapper() {
        log.info(mapper);
    }

    @Test
    public void testGetOne() {
        Long targetProductSeq = 4L;

        ProductVO vo = mapper.getOne(targetProductSeq);

        log.info(vo);
    }

//    @Test
//    public void testRead() {
//        Long targetProductSeq = 4L;
//
//        ProductVO vo = mapper.getOne(targetProductSeq);
//
//        log.info(vo);
//    }
//
//    @Test
//    public void testRead() {
//        Long targetProductSeq = 4L;
//
//        ProductVO vo = mapper.getOne(targetProductSeq);
//
//        log.info(vo);
//    }
//
//    @Test
//    public void testRead() {
//        Long targetProductSeq = 4L;
//
//        ProductVO vo = mapper.getOne(targetProductSeq);
//
//        log.info(vo);
//    }


}