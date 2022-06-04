package org.team2.service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;
import org.team2.domain.AddressVO;
import org.team2.domain.UserVO;
import org.team2.mapper.UserMapper;

import java.util.List;

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

    @Override
    public int idCheck(String id) throws Exception{
        int cnt = userMapper.idCheck(id);
        log.info("cnt: "+cnt);
        return cnt;
    }

    @Override
    public UserVO find_id(UserVO userVO) throws Exception {
        userMapper.find_id(userVO);
        return userMapper.find_id(userVO);
    }

    @Override
    public UserVO readPoint(Long user_seq) throws Exception {
       return userMapper.readPoint(user_seq);
    }

    @Override
    public List<AddressVO> readAddress(Long user_seq) throws Exception {
        return userMapper.readAddress(user_seq);
    }

    @Override
    public AddressVO selectAddress(Long user_address_seq) throws Exception {
        return userMapper.selectAddress(user_address_seq);
    }
}
