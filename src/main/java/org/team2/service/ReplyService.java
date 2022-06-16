package org.team2.service;

import org.team2.domain.CategoryVO;
import org.team2.domain.ReplyVO;

import java.util.List;
import java.util.Map;

public interface ReplyService {
     List<ReplyVO> getByProductSeq(Long product_seq);

     Long getReplyCount(Long product_seq);

     void insertReply(Long product_seq, Long user_seq, String reply_package, String reply_post, String reply_satis, Long reply_count);

     Map<String, String> getByPackage(Long product_seq);

     Map<String, String> getByPost(Long product_seq);

     Map<String, String> getBySatis(Long product_seq);
}
