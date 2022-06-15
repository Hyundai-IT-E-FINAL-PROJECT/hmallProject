package org.team2.service;

import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team2.domain.CategoryVO;
import org.team2.domain.ReplyVO;
import org.team2.mapper.CategoryMapper;
import org.team2.mapper.ReplyMapper;

import java.util.List;

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
}
