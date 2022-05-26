package org.team2.service;

import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team2.domain.CouponVO;
import org.team2.mapper.CouponMapper;

import java.util.List;

@Service
public class CouponServiceImpl implements CouponService{

    @Setter(onMethod_ = @Autowired)
    private CouponMapper couponMapper;

    @Override
    public List<CouponVO> getCouponList(Long user_seq) throws Exception {
        return couponMapper.getCouponList(user_seq);
    }

    @Override
    public int deleteCoupon(Long coupon_seq) throws Exception {
        return couponMapper.deleteCoupon(coupon_seq);
    }
}
