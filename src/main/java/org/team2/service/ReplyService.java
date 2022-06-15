package org.team2.service;

import org.team2.domain.CategoryVO;
import org.team2.domain.ReplyVO;

import java.util.List;

public interface ReplyService {
     List<ReplyVO> getByProductSeq(Long product_seq);

     Long getReplyCount(Long product_seq);
}
