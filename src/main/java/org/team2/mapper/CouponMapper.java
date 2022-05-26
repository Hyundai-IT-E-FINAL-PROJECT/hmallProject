package org.team2.mapper;

import org.team2.domain.CouponVO;

import java.util.List;

public interface CouponMapper {

    List<CouponVO> getCouponList(Long user_seq) throws Exception;

    int deleteCoupon(Long coupon_seq) throws Exception;

    CouponVO couponDiscount(Long coupon_seq) throws Exception;
}
