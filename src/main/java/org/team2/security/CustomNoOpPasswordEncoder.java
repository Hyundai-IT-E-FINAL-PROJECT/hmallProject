package org.team2.security;

import lombok.extern.log4j.Log4j;
import org.springframework.security.crypto.password.PasswordEncoder;

@Log4j
public class CustomNoOpPasswordEncoder implements PasswordEncoder {
    public String encode(CharSequence rawPassword){
        log.warn("before encode :"+rawPassword);
        return rawPassword.toString();
    }
    public boolean matches(CharSequence rawPassword, String encodedPassword){
        log.warn("mathes: "+rawPassword+":"+encodedPassword);
        return rawPassword.toString().equals(encodedPassword);
    }
}
