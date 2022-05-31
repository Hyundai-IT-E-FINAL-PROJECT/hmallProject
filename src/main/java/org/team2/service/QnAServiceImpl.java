package org.team2.service;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
}
