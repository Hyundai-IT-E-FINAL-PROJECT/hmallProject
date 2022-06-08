package org.team2.mapper;

import org.team2.domain.BasketVO;
import org.team2.domain.CategoryVO;

import java.util.List;
import java.util.Map;

public interface BasketMapper {
    List<BasketVO> getProductsByUserSeq(Long user_seq);

    BasketVO directBuy(Map<String, Long> map);

    Map<String, String> getBasketOne(Map<String, Long> map);
}
