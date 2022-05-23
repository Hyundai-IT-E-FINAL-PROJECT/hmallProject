package org.team2.mapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;
import org.team2.domain.ProductVO;
import org.team2.domain.enums.*;


@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/applicationContext.xml")
@Log4j
public class ProductMapperTest {
    @Setter(onMethod_ = @Autowired)
    private ProductMapper mapper;

    @Test
    public void 매퍼연결확인() {
        log.info(mapper);
    }

    @Test
    public void 특정상품가져오기() {
        Long targetProductSeq = 10L;
        ProductVO vo = mapper.getOne(targetProductSeq);
        log.info(vo.getProduct_name());
        log.info(vo);
    }

    @Test
    public void 상품등록() {
        ProductVO vo = new ProductVO();

        vo.setProduct_code(12345L);
        vo.setProduct_name("test1");
        vo.setProduct_info("info");
        vo.setProduct_detail("detail");
        vo.setProduct_brand(BrandType.ADIDAS);
        vo.setProduct_manufacture(ManufactureType.MANU1);
        vo.setProduct_country(CountryType.JAPAN);
        vo.setProduct_count(1L);
        vo.setProduct_large(CategoryLargeType.JEAN);
        vo.setProduct_small(CategorySmallType.BLUEJEANS);

        mapper.insert(vo);
    }

    @Test
    public void testGetAll() {
        Long targetProductSeq = 4L;

        ProductVO vo = mapper.getOne(targetProductSeq);

        log.info(vo);
    }
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