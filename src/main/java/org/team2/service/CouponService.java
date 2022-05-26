package org.team2.service;

import org.team2.domain.CouponVO;

import java.util.List;

public interface CouponService {


    List<CouponVO> getCouponList(Long user_seq) throws Exception;

    int deleteCoupon(Long coupon_seq) throws Exception;
}
