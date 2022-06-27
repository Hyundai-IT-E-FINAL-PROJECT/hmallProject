package org.team2.service;

import org.team2.domain.BasketVO;
import org.team2.domain.CategoryVO;

import java.util.List;
import java.util.Map;

public interface BasketService {
     List<BasketVO> getAllByUserSeq(Long user_seq);

     void addBasket(Long user_seq, Long product_seq, Long basket_count);

     void deleteBasket(Long basket_seq);

     BasketVO directBuy(Map<String, Long> map);

     Map<String, String> getBasketOne(Map<String, Long> map);
}
