package org.team2.mapper;

import org.apache.ibatis.annotations.Param;
import org.team2.domain.AddressVO;
import org.team2.domain.UserVO;

import java.util.List;

public interface UserMapper {
    void insertSignup(UserVO userVO) throws Exception;
    void insertAuth(int userNum) throws  Exception;
    public UserVO read(String user_id);
    int idCheck(String id) throws Exception;

    void insertAddress(@Param("AddressVO")AddressVO addressVO, @Param("userNum") int userNum) throws Exception;

    UserVO find_id(UserVO userVO) throws Exception;

    public UserVO readPoint(Long user_seq) throws Exception;

    List<AddressVO> readAddress(Long user_seq) throws Exception;

    AddressVO selectAddress(Long user_address_seq) throws Exception;
}
