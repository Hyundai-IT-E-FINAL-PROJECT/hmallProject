package org.team2.service;

import org.team2.domain.ImageVO;
import org.team2.domain.ProductVO;

import java.util.List;

public interface ImageService {
    List<ImageVO> getAllByProductSeq(Long product_seq);
}
