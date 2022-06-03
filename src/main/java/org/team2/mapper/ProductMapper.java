package org.team2.mapper;

import org.team2.domain.ProductVO;

import java.util.List;
import java.util.Map;

public interface ProductMapper {
    int insert(ProductVO vo);

    ProductVO getOne(Long seq);

    List<ProductVO> getAll();

    List<ProductVO> getAllWithCouponByFirstCategory(Long category_seq);

    int delete(Long seq);

    int update(ProductVO productVO);

    List<ProductVO> getMain();

    List<Map<String, String>> getUserOrder(Long user_seq);

    Map<String, String> getProductInfo(Long order_seq);
}
