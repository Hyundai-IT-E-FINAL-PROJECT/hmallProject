package org.team2.service;

import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team2.domain.CategoryVO;
import org.team2.mapper.CategoryMapper;
import org.team2.mapper.ProductMapper;

import java.util.List;
import java.util.Map;

@Service
public class CategorySerivceImpl implements CategoryService{
    @Setter(onMethod_ = @Autowired)
    private CategoryMapper categoryMapper;

    @Override
    public List<CategoryVO> getAll() {
        return categoryMapper.getAll();
    }

    @Override
    public CategoryVO getOne(Long first_category) {
        return categoryMapper.getOne(first_category);
    }

    @Override
    public List<CategoryVO> getSubCategoryList(Long first_category) {
        return categoryMapper.getSubCategoryList(first_category);
    }
}
