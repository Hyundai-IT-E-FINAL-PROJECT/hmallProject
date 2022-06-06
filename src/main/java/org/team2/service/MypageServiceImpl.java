package org.team2.service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team2.domain.DepositVO;
import org.team2.mapper.MypageMapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Log4j
@Service
public class MypageServiceImpl implements MypageService {

    @Setter(onMethod_ = @Autowired)
    private MypageMapper mypageMapper;


    @Override
    public Map recentOrders(long no) throws Exception {
        Map map = new HashMap();
        map.put("no", no);
        mypageMapper.recentOrders(map);
        return map;
    }

    @Override
    public Map periodOrders(long no, String ordStrtDt, String ordEndDt, String seType, String itemNm) throws Exception {
        Map map = new HashMap();
        map.put("no", no);
        map.put("ordStrtDt", ordStrtDt);
        map.put("ordEndDt", ordEndDt);
        map.put("seType", seType);
        map.put("itemNm", itemNm);
        mypageMapper.periodOrders(map);
        return map;
    }

    @Override
    public Map detailOrders(long no, long odno) throws Exception {
        Map map = new HashMap();
        map.put("no", no);
        map.put("odno", odno);
        mypageMapper.detailOrders(map);
        return map;
    }

    @Override
    public Map couponList(long no) throws Exception {
        Map map = new HashMap();
        map.put("no", no);
        mypageMapper.couponList(map);
        return map;
    }

    @Override
    public List<Map<String, Object>> pointList(String no, String strtDt, String endDt, String searchType) throws Exception {
        return mypageMapper.pointList(no, strtDt, endDt, searchType);
    }

    @Override
    public List<Map<String, Object>> cancelperiodOrders(String no, String ordStrtDt, String ordEndDt, String seType, String itemNm, String type) throws Exception {
        return mypageMapper.cancelperiodOrders(no, ordStrtDt, ordEndDt, seType, itemNm, type);
    }

    @Override
    public List<DepositVO> depositList(String no, String strtDt, String endDt, String searchType) throws Exception {
        return mypageMapper.depositList(no, strtDt, endDt, searchType);
    }

    @Override
    public int niknameCheck(String nknm) throws Exception {
        return mypageMapper.niknameCheck(nknm);
    }


}
