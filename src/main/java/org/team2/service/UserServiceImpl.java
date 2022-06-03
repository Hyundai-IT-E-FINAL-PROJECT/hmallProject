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

import java.util.Date;
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


    @Override
    public void myPage_newBirthday(Date user_birth, String user_id) throws Exception {
        userMapper.myPage_newBirthday(user_birth,user_id);
    }

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
    public int emailCheck(String email) throws Exception {
        int result = userMapper.emailCheck(email);
        log.info("result: "+result);
        return result;
    }

    @Override
    public UserVO find_pw(String email) throws Exception {
        userMapper.find_pw(email);
        return userMapper.find_pw(email);
    }

    @Override
    public int newPassword(UserVO userVO) throws Exception {
        userVO.setUser_pw(pwencoder.encode(userVO.getUser_pw()));
        userMapper.newPassword(userVO);
        return userMapper.newPassword(userVO);
    }

    @Override
    public UserVO myPage_pwUpate(UserVO userVO) throws Exception {
        userVO.setUser_pw(pwencoder.encode(userVO.getUser_pw()));
        userMapper.myPage_pwUpdate(userVO);
        return userMapper.myPage_pwUpdate(userVO);
    }

    @Override
    public void myPage_newNickname(UserVO userVO) throws Exception {
        userMapper.myPage_newNickname(userVO);
    }

    @Override
    public List<UserVO> getUserinfo(long no) throws Exception {
        userMapper.getUserinfo(no);
        return userMapper.getUserinfo(no);
    }
}
