package org.team2.mapper;

import org.team2.domain.CategoryVO;
import org.team2.domain.ProductVO;

import java.util.List;
import java.util.Map;

public interface CategoryMapper {
    List<CategoryVO> getAll();

    CategoryVO getOne(Long category_seq);

    List<CategoryVO> getSubCategoryList(Long category_seq);
}
