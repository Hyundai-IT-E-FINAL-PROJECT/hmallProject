package org.team2;

import lombok.extern.log4j.Log4j;
import org.junit.Test;

import java.sql.Connection;
import java.sql.DriverManager;

import static org.junit.Assert.fail;

@Log4j
public class SimpleJDBCTests {
    static {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testConnection() {
        try(Connection con = DriverManager.getConnection("jdbc:oracle:thin:@edudb_high?TNS_ADMIN=C:////Wallet_edudb", "teamKim", "xxxxxxAt21cc")) {
            log.info(con);
        } catch (Exception e) {
            fail(e.getMessage());
        }
    }
}
