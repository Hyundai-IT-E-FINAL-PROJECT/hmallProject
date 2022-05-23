package org.team2.service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;
import org.team2.domain.UserVO;
import org.team2.mapper.UserMapper;

@Log4j
@Service
@WebAppConfiguration
@ContextConfiguration("file:src/main/webapp/WEB-INF/security-context.xml")
public class UserServiceImpl implements UserService{
    //DAO = Mapper
    @Setter(onMethod_ = @Autowired)
    private UserMapper userMapper;

    @Setter(onMethod_ = @Autowired)
    private PasswordEncoder pwencoder;

    @Transactional
    @Override
    public void insertSignup(UserVO userVO) throws Exception{
        userVO.setUser_pw(pwencoder.encode(userVO.getUser_pw()));
        log.info(userVO.getUser_pw());
        userMapper.insertSignup(userVO);
        int userNum = userVO.getNo();
        log.info(userNum);
        userMapper.insertAuth(userNum);
    }
}
