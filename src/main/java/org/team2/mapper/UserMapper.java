package org.team2.mapper;

import org.apache.ibatis.annotations.Param;
import org.team2.domain.AddressVO;
import org.team2.domain.UserVO;

public interface UserMapper {
    void insertSignup(UserVO userVO) throws Exception;
    void insertAuth(int userNum) throws  Exception;
    public UserVO read(String user_id);
    int idCheck(String id) throws Exception;

    void insertAddress(@Param("AddressVO")AddressVO addressVO, @Param("userNum") int userNum) throws Exception;

    UserVO find_id(UserVO userVO) throws Exception;
}
