package org.team2.mapper;

import org.apache.ibatis.annotations.Param;
import org.team2.domain.FundParticipantsVO;
import org.team2.domain.FundVO;
import org.team2.domain.RewardVO;

import java.util.List;
import java.util.Map;

public interface FundingMapper {
    void insertFunding(FundVO fundVO) throws Exception;

    void insertReward(RewardVO rewardVO) throws Exception;

    List<FundVO> getUserFund(Long user_seq) throws Exception;

    void deleteUserFund(Long fund_product_seq) throws Exception;
    List<Map<Integer, Object>> readFundingProduct(FundVO fundVO) throws Exception;

    List<Map<Integer, Object>> readFundigProductDetail(int fund_product_seq) throws Exception;

    List<FundVO> getAllFund() throws Exception;

    void updateFundStatus(Long fund_product_seq) throws Exception;

    void fundingProcess(@Param("rewardVO") RewardVO rewardVO, @Param("fundParticipantsVO")FundParticipantsVO fundParticipantsVO) throws Exception;
}
