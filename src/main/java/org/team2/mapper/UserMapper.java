package org.team2.mapper;

import org.team2.domain.UserVO;

public interface UserMapper {
    void insertSignup(UserVO userVO) throws Exception;
    void insertAuth(int userNum) throws  Exception;
}
