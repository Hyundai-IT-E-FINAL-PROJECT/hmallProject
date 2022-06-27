package org.team2.service;

import org.team2.domain.ProductVO;

import java.util.List;
import java.util.Map;

public interface ProductService {
    ProductVO getOne(Long product_seq);

    List<ProductVO> getAll();

    List<ProductVO> searchProducts(Long first_category, Long second_category, String search_text, String sort, Long page_num);

    Long searchProductsCounts(Long first_category, Long second_category, String search_text, String sort);

    List<ProductVO> getMain();
    int insert(ProductVO productVO);
    int delete(ProductVO productVO);
    int update(ProductVO productVO);
    List<Map<String, String>> getUserOrder(Long user_seq);
    List<Map<String, String>> getProductInfo(Long order_seq);
}
