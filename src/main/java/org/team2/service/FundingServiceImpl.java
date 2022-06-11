package org.team2.service;

import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.team2.domain.FundVO;
import org.team2.domain.RewardVO;
import org.team2.mapper.FundingMapper;

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
}
