package org.team2.service;

import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.team2.domain.*;
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

    @Override
    public void fundingProcess(RewardVO rewardVO, FundParticipantsVO fundParticipantsVO) throws Exception {
        fundingMapper.fundingProcess(rewardVO, fundParticipantsVO);
    }

    @Override
    public void insertReply(FundReplyVO fundReplyVO) throws Exception {
        fundingMapper.insertReply(fundReplyVO);
    }

    @Override
    public List<Map<String, Object>> selectReply(FundReplyVO fundReplyVO) throws Exception {
        return fundingMapper.selectReply(fundReplyVO);
    }

    @Override
    public FundVO best1FundProduct() throws Exception {
        return fundingMapper.best1FundProduct();
    }

    @Override
    public FundVO deadlineProduct() throws Exception {
        return fundingMapper.deadlineProduct();
    }

    @Override
    public void deleteReply(int delete_seq) throws Exception {
        fundingMapper.deleteReply(delete_seq);
    }

    @Override
    public void insertNotice(FundNoticeVO fundNoticeVO) throws Exception {
        fundingMapper.insertNotice(fundNoticeVO);
    }

    @Override
    public List<Map<String, Object>> selectInfo(FundNoticeVO fundNoticeVO) throws Exception {
        return fundingMapper.selectInfo(fundNoticeVO);
    }

    @Override
    public void deleteInfo(int delete_seq) throws Exception {
        fundingMapper.deleteInfo(delete_seq);
    }

    @Override
    public List<Map<String, Object>> selectDate(int product_seq) throws Exception {
        return fundingMapper.selectDate(product_seq);
    }

    @Override
    public void insertFile(AttachFileVO attachFileVO) throws Exception {
        fundingMapper.insertFile(attachFileVO);
    }
}
