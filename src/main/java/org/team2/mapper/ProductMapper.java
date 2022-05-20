package org.team2.mapper;

import org.team2.domain.ProductVO;

public interface ProductMapper {
    int insert(ProductVO vo);

    ProductVO getOne(Long seq);

    int delete(Long seq);

    int update(Long seq);
}
