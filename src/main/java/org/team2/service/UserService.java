package org.team2.service;

import org.team2.domain.UserVO;

public interface UserService {
    void insertSignup(UserVO userVO) throws Exception;
    public int idCheck(String id) throws Exception;
    UserVO find_id(UserVO userVO) throws Exception;
    int emailCheck(String email) throws Exception;

    UserVO find_pw(String email) throws Exception;

    int newPassword(UserVO userVO) throws Exception;

//    public int idCheck(String id) throws  Exception;
}
