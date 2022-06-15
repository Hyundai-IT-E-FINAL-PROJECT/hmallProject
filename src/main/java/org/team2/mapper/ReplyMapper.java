package org.team2.mapper;

import org.team2.domain.ReplyVO;

import java.util.List;

public interface ReplyMapper {
    List<ReplyVO> getReplyByProductSeq(Long product_seq);

    Long getReplyCount(Long product_seq);
}
