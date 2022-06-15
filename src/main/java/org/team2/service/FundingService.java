package org.team2.service;

import org.team2.domain.*;

import java.util.List;
import java.util.Map;

public interface FundingService {
    void insertFunding(FundVO fundVO) throws Exception;

    void insertReward(RewardVO rewardVO) throws Exception;

    List<FundVO> getUserFund(Long user_seq) throws Exception;

    void deleteUserFund(Long fund_product_seq) throws Exception;
    List<Map<Integer, Object>> readFundingProduct(FundVO fundVO) throws Exception;

    List<Map<Integer, Object>> readFundigProductDetail(int fund_product_seq) throws Exception;

    List<FundVO> getAllFund() throws Exception;

    void updateFundStatus(Long fund_product_seq) throws Exception;

    void fundingProcess(RewardVO rewardVO, FundParticipantsVO fundParticipantsVO) throws Exception;

    void insertReply(FundReplyVO fundReplyVO) throws Exception;

    List<Map<String, Object>> selectReply(FundReplyVO fundReplyVO) throws Exception;

    List<FundVO> best1FundProduct() throws Exception;

    List<FundVO> deadlineProduct() throws Exception;

    void deleteReply(int delete_seq) throws Exception;

    void insertNotice(FundNoticeVO fundNoticeVO) throws Exception;

    List<Map<String, Object>> selectInfo(FundNoticeVO fundNoticeVO) throws Exception;

    void deleteInfo(int delete_seq) throws Exception;

    List<Map<String, Object>> selectDate(int product_seq) throws Exception;

    List<Map<String, Object>> participatedFund(Long user_seq) throws Exception;

    void insertFile(AttachFileVO attachFileVO) throws Exception;
}
