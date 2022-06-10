package org.team2.service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
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
    public Map adminPeriodOrders(String ordStrtDt, String ordEndDt, String seType, String itemNm) throws Exception {
        Map map = new HashMap();
        map.put("ordStrtDt", ordStrtDt);
        map.put("ordEndDt", ordEndDt);
        map.put("seType", seType);
        map.put("itemNm", itemNm);
        mypageMapper.adminPeriodOrders(map);
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
    public List<Map<String, Object>> cancelperiodOrders(String no, String ordStrtDt, String ordEndDt, String seType, String itemNm) throws Exception {
        return mypageMapper.cancelperiodOrders(no, ordStrtDt, ordEndDt, seType, itemNm);
    }

    @Override
    public List<DepositVO> depositList(String no, String strtDt, String endDt, String searchType) throws Exception {
        return mypageMapper.depositList(no, strtDt, endDt, searchType);
    }

    @Override
    public int niknameCheck(String nknm) throws Exception {
        return mypageMapper.niknameCheck(nknm);
    }

    @Override
    public int checkUpdate(String emaailval, String smsval, String genderval, String userid) throws Exception {
        return mypageMapper.checkUpdate(emaailval, smsval, genderval, userid);
    }

    @Override
    public Map deliveryList(long no) throws Exception {
        Map map = new HashMap();
        map.put("no", no);
        mypageMapper.deliveryList(map);
        return map;
    }

    @Override
    public Map orderStatus(long no) throws Exception {
        Map map = new HashMap();
        map.put("no", no);
        mypageMapper.orderStatus(map);
        return map;
    }
    public void DropUser(int no) throws Exception {
        mypageMapper.DropUser(no);
    }

    @Override
    public int deleteDelivery(long adno) throws Exception{
        return mypageMapper.deleteDelivery(adno);
    }

    @Transactional
    @Override
    public void baseDelivery(long adno) throws Exception {
        mypageMapper.changeDelivery();
        mypageMapper.baseDelivery(adno);
    }


}
