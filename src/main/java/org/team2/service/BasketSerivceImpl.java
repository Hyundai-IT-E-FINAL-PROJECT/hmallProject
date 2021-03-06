package org.team2.service;

import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team2.domain.BasketVO;
import org.team2.domain.CategoryVO;
import org.team2.mapper.BasketMapper;
import org.team2.mapper.CategoryMapper;

import java.util.List;
import java.util.Map;

@Service
public class BasketSerivceImpl implements BasketService{
    @Setter(onMethod_ = @Autowired)
    private BasketMapper basketMapper;

    @Override
    public List<BasketVO> getAllByUserSeq(Long user_seq) {
        return basketMapper.getProductsByUserSeq(user_seq);
    }

    @Override
    public void addBasket(Long user_seq, Long product_seq, Long basket_count) {
        basketMapper.addBasket(user_seq, product_seq, basket_count);
    }

    @Override
    public void deleteBasket(Long basket_seq) {
        basketMapper.deleteBasket(basket_seq);
    }

    @Override
    public BasketVO directBuy(Map<String, Long> map) {
        return basketMapper.directBuy(map);
    }

    @Override
    public Map<String, String> getBasketOne(Map<String, Long> map) {
        return basketMapper.getBasketOne(map);
    }
}
