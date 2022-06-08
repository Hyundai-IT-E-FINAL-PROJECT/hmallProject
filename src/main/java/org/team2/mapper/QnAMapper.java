package org.team2.mapper;

import org.team2.domain.QaVO;
import org.team2.domain.QnAVO;

import java.util.List;
import java.util.Map;

public interface QnAMapper {

    int registerQnA(QnAVO vo)  throws Exception;

    List<Map<String, String>> getQnAList() throws Exception;

    Integer addReply(QaVO vo) throws Exception;

    List<Map<String, String>> getMyQnAList(Long user_seq) throws Exception;
}
