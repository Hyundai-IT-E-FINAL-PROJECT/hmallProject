package org.team2.mapper;

import org.team2.domain.ImageVO;

import java.util.List;

public interface ImageMapper {
    List<ImageVO> getAllByProductSeq(Long product_seq);
}
