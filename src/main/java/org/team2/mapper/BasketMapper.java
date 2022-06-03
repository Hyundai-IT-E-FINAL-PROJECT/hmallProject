package org.team2.mapper;

import org.team2.domain.BasketVO;
import org.team2.domain.CategoryVO;

import java.util.List;

public interface BasketMapper {
    List<BasketVO> getProductsByUserSeq(Long user_seq);
}
