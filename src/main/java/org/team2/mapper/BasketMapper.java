package org.team2.mapper;

import org.apache.ibatis.annotations.Param;
import org.team2.domain.BasketVO;
import org.team2.domain.CategoryVO;

import java.util.List;
import java.util.Map;

public interface BasketMapper {
    List<BasketVO> getProductsByUserSeq(Long user_seq);

    void addBasket(@Param("user_seq") Long user_seq, @Param("product_seq") Long product_seq, @Param("basket_count") Long basket_count);

    void deleteBasket(@Param("basket_seq") Long basket_seq);

    BasketVO directBuy(Map<String, Long> map);

    Map<String, String> getBasketOne(Map<String, Long> map);
}
