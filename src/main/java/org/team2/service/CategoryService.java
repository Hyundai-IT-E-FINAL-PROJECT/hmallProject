package org.team2.service;

import org.team2.domain.CategoryVO;
import org.team2.domain.UserVO;

import java.util.List;
import java.util.Map;

public interface CategoryService {
     List<CategoryVO> getAll();

     CategoryVO getOne(Long first_category);

     List<CategoryVO> getSubCategoryList(Long first_category);
}
