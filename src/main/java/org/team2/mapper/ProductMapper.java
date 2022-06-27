package org.team2.mapper;

import org.apache.ibatis.annotations.Param;
import org.team2.domain.ProductVO;

import java.util.List;
import java.util.Map;

public interface ProductMapper {
    int insert(ProductVO vo);

    ProductVO getOne(Long product_seq);

    List<ProductVO> getAll();

    List<ProductVO> searchProducts(@Param("first_category") Long first_category, @Param("second_category") Long second_category, @Param("search_text") String search_text, @Param("sort") String sort, @Param("page_num") Long page_num);

    Long searchProductsCounts(@Param("first_category") Long first_category, @Param("second_category") Long second_category, @Param("search_text") String search_text, @Param("sort") String sort);

    int delete(Long seq);

    int update(ProductVO productVO);

    List<ProductVO> getMain();

    List<Map<String, String>> getUserOrder(Long user_seq);

    List<Map<String, String>> getProductInfo(Long order_seq);
}
