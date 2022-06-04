package org.team2.mapper;

import org.apache.ibatis.annotations.Param;
import org.team2.domain.CategoryVO;
import org.team2.domain.ProductVO;

import java.util.List;
import java.util.Map;

public interface CategoryMapper {
    List<CategoryVO> getAll();

    CategoryVO getOne(@Param("first_category") Long first_category);

    List<CategoryVO> getSubCategoryList(@Param("first_category") Long first_category);
}
