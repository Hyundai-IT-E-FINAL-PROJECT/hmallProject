package org.team2.service;

import org.team2.domain.AddressVO;
import org.team2.domain.UserVO;

public interface AddressService {
    void insertAddress(AddressVO addressVO, UserVO userVO) throws Exception;

    void insertNewAddress(AddressVO addressVO) throws Exception;
}
