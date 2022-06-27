package org.team2.service;

import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team2.domain.NoticeVO;
import org.team2.mapper.NoticeMapper;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {
    @Setter(onMethod_=@Autowired)
    NoticeMapper noticeMapper;

    @Override
    public List<NoticeVO> read() throws Exception {
        return noticeMapper.read();
    }
}
