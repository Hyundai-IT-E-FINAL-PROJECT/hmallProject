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
}
