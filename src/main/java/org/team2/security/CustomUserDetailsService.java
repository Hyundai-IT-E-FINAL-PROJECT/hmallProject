package org.team2.security;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.team2.domain.CustomUser;
import org.team2.domain.UserVO;
import org.team2.mapper.UserMapper;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {
    @Setter(onMethod_ = {@Autowired})
    private UserMapper userMapper;

    @Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException{
        log.warn("Load User By UserName : " + userName);
        UserVO vo = userMapper.read(userName);
        log.warn("queried by user mapper: "+vo);
        return vo == null ? null : new CustomUser(vo);
    }
}