package org.team2.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.security.core.parameters.P;
import org.team2.domain.AddressVO;
import org.team2.domain.UserVO;
import java.util.Date;
import java.util.List;

public interface UserMapper {
    void insertSignup(UserVO userVO) throws Exception;
    void insertAuth(int userNum) throws  Exception;
    public UserVO read(String user_id);
    int idCheck(String id) throws Exception;
    int emailCheck(String email) throws Exception;
    void insertAddress(@Param("AddressVO")AddressVO addressVO, @Param("UserVO")UserVO userVO, @Param("userNum") int userNum) throws Exception;
    UserVO find_id(UserVO userVO) throws Exception;

    public UserVO readPoint(Long user_seq) throws Exception;

    List<AddressVO> readAddress(Long user_seq) throws Exception;

    AddressVO selectAddress(Long user_address_seq) throws Exception;
    UserVO find_pw(String email) throws Exception;
    int newPassword(UserVO userVO) throws Exception;
    UserVO myPage_pwUpdate(UserVO userVO) throws Exception;
    void myPage_newNickname(UserVO userVO) throws Exception;
    List<UserVO> getUserinfo(long no) throws Exception;
    void myPage_newBirthday(Date user_birth, String user_id) throws Exception;
}
