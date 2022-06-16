package org.team2.service;

import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team2.domain.CategoryVO;
import org.team2.domain.ReplyVO;
import org.team2.mapper.CategoryMapper;
import org.team2.mapper.ReplyMapper;

import java.util.List;
import java.util.Map;

@Service
public class ReplySerivceImpl implements ReplyService{
    @Setter(onMethod_ = @Autowired)
    private ReplyMapper replyMapper;

    @Override
    public List<ReplyVO> getByProductSeq(Long product_seq) {
        return replyMapper.getReplyByProductSeq(product_seq);
    }

    @Override
    public Long getReplyCount(Long product_seq) {
        return replyMapper.getReplyCount(product_seq);
    }

    @Override
    public void insertReply(Long product_seq, Long user_seq, String reply_package, String reply_post, String reply_satis, Long reply_count) {
        replyMapper.newReply(product_seq, user_seq, reply_package, reply_post, reply_satis, reply_count);
    }

    @Override
    public List<Map<String, String>> getByPackage(Long product_seq) {
        return replyMapper.getByPackage(product_seq);
    }

    @Override
    public List<Map<String, String>> getByPost(Long product_seq) {
        return replyMapper.getByPost(product_seq);
    }

    @Override
    public List<Map<String, String>> getBySatis(Long product_seq) {
        return replyMapper.getBySatis(product_seq);
    }

    @Override
    public Long getStar(Long product_seq) {
        return replyMapper.getStar(product_seq);
    }
}
