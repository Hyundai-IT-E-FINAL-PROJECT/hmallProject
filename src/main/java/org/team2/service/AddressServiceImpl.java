package org.team2.service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.team2.domain.AddressVO;
import org.team2.domain.UserVO;
import org.team2.mapper.UserMapper;

@Log4j
@Service
public class AddressServiceImpl implements AddressService {

    @Setter(onMethod_ = @Autowired)
    private UserMapper userMapper;

    @Transactional
    @Override
    public void insertAddress(AddressVO addressVO, UserVO userVO) throws Exception{
        int userNum = userVO.getNo();
        log.info(userNum);
        userMapper.insertAddress(addressVO, userVO, userNum);
    }
}
