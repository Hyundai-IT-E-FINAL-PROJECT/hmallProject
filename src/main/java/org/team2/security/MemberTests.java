package org.team2.security;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.support.incrementer.DataFieldMaxValueIncrementer;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import javax.sql.DataSource;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:/src/main/webapp/WEB-INF/applicationContext.xml","file:/src/main/webapp/WEB-INF/security-context.xml"})
@Log4j
public class MemberTests {
    @Setter(onMethod_ = @Autowired)
    private PasswordEncoder pwencoder;

    @Setter(onMethod_ = @Autowired)
    private DataSource ds;

//    private DataFieldMaxValueIncrementer incrementer;
//    public void setIncrementer(DataFieldMaxValueIncrementer incrementer){
//        this.incrementer = incrementer;
//    }
    @Test
    public void testInsertMember(){
        String sql = "INSERT INTO TBL_USER VALUES (SEQ_USER,?,?,?,?,?,?,?,?,?,?,?)";
    }
}
