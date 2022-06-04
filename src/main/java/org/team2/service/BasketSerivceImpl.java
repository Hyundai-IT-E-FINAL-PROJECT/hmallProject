package org.team2.service;

import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team2.domain.BasketVO;
import org.team2.domain.CategoryVO;
import org.team2.mapper.BasketMapper;
import org.team2.mapper.CategoryMapper;

import java.util.List;

@Service
public class BasketSerivceImpl implements BasketService{
    @Setter(onMethod_ = @Autowired)
    private BasketMapper basketMapper;

    @Override
    public List<BasketVO> getAllByUserSeq(Long user_seq) {
        return basketMapper.getProductsByUserSeq(user_seq);
    }
}
