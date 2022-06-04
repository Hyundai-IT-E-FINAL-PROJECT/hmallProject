package org.team2.service;

import org.team2.domain.BasketVO;
import org.team2.domain.CategoryVO;

import java.util.List;
import java.util.Map;

public interface BasketService {
     List<BasketVO> getAllByUserSeq(Long user_seq);

     BasketVO directBuy(Map<String, Long> map);
}
