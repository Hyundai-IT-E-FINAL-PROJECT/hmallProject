package org.team2.service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team2.mapper.MypageMapper;

import java.util.List;
import java.util.Map;

@Log4j
@Service
public class MypageServiceImpl implements MypageService {

    @Setter(onMethod_ = @Autowired)
    private MypageMapper mypageMapper;


    @Override
    public List<Map<String,Object>>  recentOrders(long no) throws Exception {
        return mypageMapper.recentOrders(no);
    }

    @Override
    public List<Map<String, Object>> periodOrders(long no, String ordStrtDt, String ordEndDt, String seType, String itemNm) throws Exception {
        return mypageMapper.periodOrders(no, ordStrtDt, ordEndDt, seType, itemNm);
    }

}
