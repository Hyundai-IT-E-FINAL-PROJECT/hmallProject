package org.team2.mapper;

import org.apache.ibatis.annotations.Param;
import org.team2.domain.FundVO;
import org.team2.domain.RewardVO;

public interface FundingMapper {
    void insertFunding(FundVO fundVO) throws Exception;

    void insertReward(RewardVO rewardVO) throws Exception;
}
