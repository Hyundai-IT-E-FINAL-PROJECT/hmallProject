package org.team2.domain;

import lombok.Getter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;
import java.util.stream.Collectors;

@Getter
public class CustomUser extends User {
    private static final long serialVersionUID = 1L;
    private UserVO userVO;

    public CustomUser(String no, String password, Collection<? extends GrantedAuthority> authorities){
        super(no,password,authorities);
    }
    public CustomUser(UserVO vo){
        super(String.valueOf(vo.getNo()), vo.getUser_pw(), vo.getAuthList().stream().map(user_auth_authority
                -> new SimpleGrantedAuthority(user_auth_authority.getUser_auth_authority())).collect(Collectors.toList()));
        this.userVO = vo;
    }
}