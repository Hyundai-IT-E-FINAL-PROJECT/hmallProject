package org.team2.mapper;

import org.team2.domain.NoticeVO;

import java.util.List;

public interface NoticeMapper {
    List<NoticeVO> read() throws Exception;
}
