package org.team2.service;

import org.team2.domain.FundVO;
import org.team2.domain.RewardVO;

public interface FundingService {
    void insertFunding(FundVO fundVO) throws Exception;

    void insertReward(RewardVO rewardVO) throws Exception;
}
