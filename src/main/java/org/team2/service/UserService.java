package org.team2.service;

import org.team2.domain.AddressVO;
import org.team2.domain.UserVO;

import java.util.List;

public interface UserService {
    void insertSignup(UserVO userVO) throws Exception;
    public int idCheck(String id) throws Exception;

    UserVO find_id(UserVO userVO) throws Exception;

    UserVO readPoint(Long user_seq) throws Exception;

//    public int idCheck(String id) throws  Exception;

    List<AddressVO> readAddress(Long user_seq) throws Exception;

    AddressVO selectAddress(Long user_address_seq) throws Exception;
}
