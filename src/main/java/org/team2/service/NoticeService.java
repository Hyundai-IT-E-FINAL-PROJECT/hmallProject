package org.team2.service;

import org.team2.domain.NoticeVO;

import java.util.List;

public interface NoticeService {

    List<NoticeVO> read() throws Exception;
}
