package org.team2.service;

import org.team2.domain.ProductVO;

import java.util.List;
import java.util.Map;

public interface ProductService {
    ProductVO getOne(Long seq);

    List<ProductVO> getAll();

    List<ProductVO> getMain();
    int insert(ProductVO productVO);
    int delete(ProductVO productVO);
    int update(ProductVO productVO);
    List<Map<String, String>> getUserOrder(Long user_seq);
    Map<String, String> getProductInfo(Long order_seq);
}
