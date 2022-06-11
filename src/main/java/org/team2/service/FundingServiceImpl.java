package org.team2.service;

import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.team2.domain.FundVO;
import org.team2.domain.RewardVO;
import org.team2.mapper.FundingMapper;

import java.util.List;
import java.util.Map;
@Service
public class FundingServiceImpl implements FundingService{

    @Setter(onMethod_ = @Autowired)
    private FundingMapper fundingMapper;

    @Transactional
    @Override
    public void insertFunding(FundVO fundVO) throws Exception {
        fundingMapper.insertFunding(fundVO);
    }

    @Transactional
    @Override
    public void insertReward(RewardVO rewardVO) throws Exception{
        fundingMapper.insertReward(rewardVO);
    }

    @Override
    public List<FundVO> getUserFund(Long user_seq) throws Exception {
        return fundingMapper.getUserFund(user_seq);
    }

    @Override
    public void deleteUserFund(Long fund_product_seq) throws Exception {
        fundingMapper.deleteUserFund(fund_product_seq);
    }

    public List<Map<Integer, Object>> readFundingProduct(FundVO fundVO) throws Exception {
        return fundingMapper.readFundingProduct(fundVO);
    }

    @Override
    public List<Map<Integer, Object>> readFundigProductDetail(int fund_product_seq) throws Exception {
        return fundingMapper.readFundigProductDetail(fund_product_seq);
    }

    @Override
    public List<FundVO> getAllFund() throws Exception {
        return fundingMapper.getAllFund();
    }

    @Override
    public void updateFundStatus(Long fund_product_seq) throws Exception {
        fundingMapper.updateFundStatus(fund_product_seq);
    }
}
