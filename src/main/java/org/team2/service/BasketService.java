package org.team2.service;

import org.team2.domain.BasketVO;
import org.team2.domain.CategoryVO;

import java.util.List;

public interface BasketService {
     List<BasketVO> getAllByUserSeq(Long user_seq);
}
