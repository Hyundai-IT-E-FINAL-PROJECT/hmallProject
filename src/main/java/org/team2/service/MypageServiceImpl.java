package org.team2.service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team2.domain.DepositVO;
import org.team2.mapper.MypageMapper;

import java.util.List;
import java.util.Map;

@Log4j
@Service
public class MypageServiceImpl implements MypageService {

    @Setter(onMethod_ = @Autowired)
    private MypageMapper mypageMapper;


    @Override
    public List<Map<String,Object>>  recentOrders(String no) throws Exception {
        return mypageMapper.recentOrders(no);
    }

    @Override
    public List<Map<String, Object>> periodOrders(String no, String ordStrtDt, String ordEndDt, String seType, String itemNm) throws Exception {
        return mypageMapper.periodOrders(no, ordStrtDt, ordEndDt, seType, itemNm);
    }

    @Override
    public List<Map<String, Object>> detailOrders(String no, long odno) throws Exception {
        return mypageMapper.detailOrders(no, odno);
    }

    @Override
    public List<Map<String, Object>> couponList(String no) throws Exception {
        return mypageMapper.couponList(no);
    }

    @Override
    public List<Map<String, Object>> pointList(String no, String strtDt, String endDt, String searchType) throws Exception {
        return mypageMapper.pointList(no, strtDt, endDt, searchType);
    }

    @Override
    public List<Map<String, Object>> cancelperiodOrders(String no, String ordStrtDt, String ordEndDt, String seType, String itemNm, String type) throws Exception {
        return mypageMapper.returnperiodOrders(no, ordStrtDt, ordEndDt, seType, itemNm, type);
    }

    @Override
    public List<DepositVO> depositList(String no, String strtDt, String endDt, String searchType) throws Exception {
        return mypageMapper.depositList(no, strtDt, endDt, searchType);
    }


}
