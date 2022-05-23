package org.team2.service;

import org.team2.domain.UserVO;

public interface UserService {
    void insertSignup(UserVO userVO) throws Exception;
}
