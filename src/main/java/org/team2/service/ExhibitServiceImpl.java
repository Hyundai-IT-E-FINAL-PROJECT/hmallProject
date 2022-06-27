package org.team2.service;

import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team2.mapper.ExhibitMapper;

import java.util.List;
import java.util.Map;

@Service
public class ExhibitServiceImpl implements ExhibitService{

    @Setter(onMethod_ = @Autowired)
    private ExhibitMapper exhibitMapper;

    @Override
    public List<Map<Integer, Object>> euro_exhibit(String exhibit_num) throws Exception {
        return exhibitMapper.euro_exhibit(exhibit_num);
    }

    @Override
    public List<Map<Integer, Object>> cosmetics(String exhibit_num) throws Exception {
        return exhibitMapper.cosmetics(exhibit_num);
    }

    @Override
    public List<Map<Integer, Object>> hit_product(String exhibit_num) throws Exception {
        return exhibitMapper.hit_product(exhibit_num);
    }

    @Override
    public List<Map<String, Object>> sort_exhibit(String exhibit_num, String sort_value) throws Exception {
        return exhibitMapper.sort_exhibit(exhibit_num, sort_value);
    }
}
