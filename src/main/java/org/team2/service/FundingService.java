package org.team2.service;

import org.team2.domain.FundVO;
import org.team2.domain.RewardVO;

import java.util.List;

public interface FundingService {
    void insertFunding(FundVO fundVO) throws Exception;

    void insertReward(RewardVO rewardVO) throws Exception;

    List<FundVO> getUserFund(Long user_seq) throws Exception;

    void deleteUserFund(Long fund_product_seq) throws Exception;
}
