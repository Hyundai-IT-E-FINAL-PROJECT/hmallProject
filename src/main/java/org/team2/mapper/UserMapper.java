package org.team2.mapper;

import org.team2.domain.UserVO;

public interface UserMapper {
    void insertSignup(UserVO userVO) throws Exception;
    void insertAuth(int userNum) throws  Exception;
    public UserVO read(String user_id);

    int idCheck(String id) throws Exception;
}
