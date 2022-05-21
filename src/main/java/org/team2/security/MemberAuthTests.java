package org.team2.security;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;

@RunWith(SpringRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/applicationContext.xml","file:src/main/webapp/WEB-INF/security-context.xml"})
@Log4j
public class MemberAuthTests {
    @Setter(onMethod_ = @Autowired)
    private PasswordEncoder pwencoder;

    @Setter(onMethod_ = @Autowired)
    private DataSource ds;

    @Test
    public void testInsertMemberAuth(){
        String sql = "insert into tbl_user_auth values(?,?,?,?,?)";
        Connection con = null;
        PreparedStatement pstmt = null;
        try{
            con = ds.getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, 4);
            pstmt.setInt(2, 2);
            pstmt.setString(3,"ROLE_ADMIN");
            pstmt.setDate(4,java.sql.Date.valueOf("2020-05-20"));
            pstmt.setDate(5,java.sql.Date.valueOf("2020-05-20"));


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
