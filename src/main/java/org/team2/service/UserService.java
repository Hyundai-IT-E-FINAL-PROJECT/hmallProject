package org.team2.service;

import org.team2.domain.AddressVO;
import org.team2.domain.UserVO;

import org.springframework.http.HttpStatus;
import org.team2.domain.UserVO;
import java.util.Date;
import java.util.List;

public interface UserService {
    void myPage_newBirthday(Date user_birth, String user_id) throws Exception;
    void insertSignup(UserVO userVO) throws Exception;
    public int idCheck(String id) throws Exception;
    UserVO find_id(UserVO userVO) throws Exception;
    int emailCheck(String email) throws Exception;

    UserVO find_pw(String email) throws Exception;

    int newPassword(UserVO userVO) throws Exception;

    UserVO myPage_pwUpate(UserVO userVO) throws Exception;

    void myPage_newNickname(UserVO userVO) throws Exception;

    List<UserVO> getUserinfo(long no) throws Exception;


    UserVO readPoint(Long user_seq) throws Exception;

//    public int idCheck(String id) throws  Exception;

    List<AddressVO> readAddress(Long user_seq) throws Exception;

    AddressVO selectAddress(Long user_address_seq) throws Exception;

    AddressVO selectBasicAddress(Long user_seq) throws Exception;

    int email_dup(String total_email) throws Exception;

    void insertFirstCoupon(int no) throws Exception;
}
