package org.team2.mapper;

import org.apache.ibatis.annotations.Param;
import org.team2.domain.ReplyVO;

import java.util.List;
import java.util.Map;

public interface ReplyMapper {
    List<ReplyVO> getReplyByProductSeq(Long product_seq);
    Long getReplyCount(Long product_seq);
    void newReply(@Param("product_seq") Long product_seq, @Param("user_seq") Long user_seq, @Param("reply_package") String reply_package, @Param("reply_post") String reply_post, @Param("reply_satis") String reply_satis, @Param("star") Long star);

    List<Map<String, String>> getByPackage(Long product_seq);

    List<Map<String, String>> getByPost(Long product_seq);

    List<Map<String, String>> getBySatis(Long product_seq);

    Long getStar(Long product_seq);

    void setReply(Long order_seq);
}
