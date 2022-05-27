package org.team2.mapper;

import org.team2.domain.ProductVO;

import java.util.List;

public interface ProductMapper {
    int insert(ProductVO vo);

    ProductVO getOne(Long seq);

    List<ProductVO> getAll();

    int delete(Long seq);

    int update(ProductVO productVO);

    List<ProductVO> getMain();

    List<ProductVO> getUserOrder(Long user_seq);
}
