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
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

@RunWith(SpringRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/applicationContext.xml","file:src/main/webapp/WEB-INF/security-context.xml"})
@Log4j
public class MemberTests {


    @Setter(onMethod_ = @Autowired)
    private PasswordEncoder pwencoder;

    @Setter(onMethod_ = @Autowired)
    private DataSource ds;

    @Test
    public void testInsertMember(){
        String sql = "insert into tbl_user values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        Connection con = null;
        PreparedStatement pstmt = null;
        try{
            con = ds.getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, 2);
            pstmt.setString(2,"bobo");
            pstmt.setString(3,pwencoder.encode("pw"+1));
            pstmt.setString(4,"김보경");
            pstmt.setString(5,"010-7768-8001");
            pstmt.setDate(6,java.sql.Date.valueOf("2020-05-20"));
            pstmt.setDate(7,java.sql.Date.valueOf("2020-05-20"));
            pstmt.setString(8,"test03@daum.net");
            pstmt.setDate(9,java.sql.Date.valueOf("2020-11-20"));
            pstmt.setString(10,"여");
            pstmt.setString(11,"1");
            pstmt.setString(12,"1");
            pstmt.setString(13,"지코");
            pstmt.setInt(14,0);
            pstmt.setInt(15,1);
            pstmt.setInt(16,1);

            pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if(pstmt != null){
                try {
                    pstmt.close();
                }catch (Exception e){

                }
            }if(con != null){
                try{
                    con.close();
                }catch (Exception e){

                }
            }
        }
    }
}
