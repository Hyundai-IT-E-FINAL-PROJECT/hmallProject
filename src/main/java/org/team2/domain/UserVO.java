package org.team2.domain;

import lombok.Data;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.web.WebAppConfiguration;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
public class UserVO implements Serializable {

    //pk
    private int no;
    private String user_id;
    private String user_pw;
    private String user_name;
    private String user_phone;
    private String user_email;
    private String user_birth;
    private String user_gender;
    private String user_email_receive;
    private String user_sms_receive;
    private String user_level;
    private List<AuthVO> authList;
    private List<AddressVO> addressList;

    private Date created_at;
    private Date updated_at;
}
