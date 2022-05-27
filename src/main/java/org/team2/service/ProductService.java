package org.team2.service;

import org.team2.domain.ProductVO;

import java.util.List;

public interface ProductService {
    ProductVO getOne(Long seq);

    List<ProductVO> getAll();

    List<ProductVO> getMain();
    int insert(ProductVO productVO);
    int delete(ProductVO productVO);
    int update(ProductVO productVO);
    List<ProductVO> getUserOrder(Long user_seq);
}
