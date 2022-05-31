package org.team2.service;

import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team2.domain.ImageVO;
import org.team2.domain.ProductVO;
import org.team2.mapper.ImageMapper;
import org.team2.mapper.ProductMapper;

import java.util.List;

@Service
public class ImageSerivceImpl implements ImageService {

    @Setter(onMethod_ = @Autowired)
    private ImageMapper imageMapper;

    @Override
    public List<ImageVO> getAllByProductSeq(Long product_seq) {
        return imageMapper.getAllByProductSeq(product_seq);
    }
}
