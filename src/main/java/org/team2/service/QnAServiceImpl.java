package org.team2.service;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team2.domain.QaVO;
import org.team2.domain.QnAVO;
import org.team2.mapper.QnAMapper;

import java.util.List;
import java.util.Map;

@Service
public class QnAServiceImpl implements QnAService{

    @Setter(onMethod_=@Autowired)
    private QnAMapper qnAMapper;

    @Override
    public int registerQnA(QnAVO vo) throws Exception {
        return qnAMapper.registerQnA(vo);
    }

    @Override
    public List<Map<String, String>> getQnAList() throws Exception {
        return qnAMapper.getQnAList();
    }

    @Override
    public List<Map<String, String>> getMyQnAList(Long user_seq) throws Exception {
        return qnAMapper.getMyQnAList(user_seq);
    }

    @Override
    public Integer addReply(QaVO vo) throws Exception {
        return qnAMapper.addReply(vo);
    }
}
