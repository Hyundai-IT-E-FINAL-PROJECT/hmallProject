package org.team2.mapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import oracle.jdbc.OracleTypes;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.team2.domain.OrderVO;

import javax.sql.DataSource;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

@WebAppConfiguration
@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/applicationContext.xml")
@Log4j
public class OrderMapperTest {

    @Setter(onMethod_ = @Autowired)
    private OrderMapper mapper;

    @Setter(onMethod_ = { @Autowired })
    private DataSource dataSource;

    @Test
    public void testMapper(){
        log.info(mapper);
    }

    //read test 성공
    @Test
    public void testRead(){
        log.info("testRead 시작");
        Long orderSeq=1L;
        OrderVO vo=mapper.readOne(orderSeq);
        log.info(vo);
    }
    //주문 삽입 테스트 성공
//    @Test
//    public void testInsert(){
//        log.info("testInsert 시작");
//        OrderVO orderVO=new OrderVO();
//
//        orderVO.setUser_seq(19L);
//        orderVO.setStatus("ing");
//        orderVO.setUserName("bo");
//        orderVO.setUserNumber("0101");
//        orderVO.setDelivery("newDe");
//        orderVO.setInvoice(3L);
//        orderVO.setPoint(20L);
//
//        mapper.insert(orderVO);
//    }

    @Test
    public void testUpdate(){
        log.info("update 수행중..");
        Long targetSeq=8L;
        OrderVO orderVO=new OrderVO();
        orderVO.setUserNumber("011");
        orderVO.setInvoice(20L);
        orderVO.setDelivery("수정");
        orderVO.setStatus("complete");
        orderVO.setSeq(targetSeq);
        orderVO.setPoint(200L);

        mapper.updateOrder(orderVO);
    }

    @Test
    public void testDelete(){
        Long targetSeq=9L;
        mapper.delete(targetSeq);
    }

    private Connection conn;

    //order_pack.proc_order_select_all 불러오기 (O)
    @Test
    public void testSelect(){
        log.info("test Select 중");

        String runSp="{call pack_order.proc_order_select_all(?)}";
        conn=null;
        ArrayList<OrderVO> list=new ArrayList<>();

        try{
            conn=dataSource.getConnection();
            CallableStatement callableStatement=conn.prepareCall(runSp);
            callableStatement.registerOutParameter(1, OracleTypes.CURSOR);
            callableStatement.execute();

            ResultSet resultSet = (ResultSet) callableStatement.getObject(1);

            while(resultSet.next()){
                OrderVO order=new OrderVO();
                order.setPoint(resultSet.getLong("order_point"));
                order.setSeq(resultSet.getLong("order_seq"));
                order.setStatus(resultSet.getString("order_status"));
                order.setDelivery(resultSet.getString("order_delivery"));
                order.setUserName(resultSet.getString("order_user_name"));
                order.setUserNumber(resultSet.getString("order_user_number"));
                order.setUser_seq(resultSet.getLong("user_seq"));
                order.setCreatedAt(resultSet.getDate("created_at"));
                order.setUpdatedAt(resultSet.getDate("updated_at"));
                order.setInvoice(resultSet.getLong("order_invoice"));

                list.add(order);
            }
            for(OrderVO vo:list){
                log.info(vo);
            }

            callableStatement.close();
            conn.close();

        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    //pack_order.proc_order_insert test success
    @Test
    public void testPackageInsert(){
        log.info("Package Insert 실행중");
        String runSp= "{call pack_order.proc_order_insert(?,?,?,?,?,?,?) }";
        Connection con=null;
        //exec pack_order.proc_order_insert(19,100,'준비중','김보경','01077772222','강북구',2);
        try{
            conn=dataSource.getConnection();
            CallableStatement callableStatement=conn.prepareCall(runSp);

            callableStatement.setInt(1, 19);
            callableStatement.setInt(2, 200);
            callableStatement.setString(3, "준비중");
            callableStatement.setString(4, "김보경");
            callableStatement.setString(5, "01088888888");
            callableStatement.setString(6, "수유동");
            callableStatement.setInt(7, 3);

            callableStatement.executeUpdate();
            log.info("insert complete");



        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testPackageUpdate(){
        log.info("Package Update 실행중");
        String runSp= "{call pack_order.proc_order_update(?,?,?,?,?,?,?) }";
        Connection con=null;
        //exec pack_order.proc_order_insert(19,100,'준비중','김보경','01077772222','강북구',2);
        try{
            conn=dataSource.getConnection();
            CallableStatement callableStatement=conn.prepareCall(runSp);

            callableStatement.setInt(1, 1);
            callableStatement.setInt(2, 300);
            callableStatement.setString(3, "배송중");
            callableStatement.setString(4, "김보경");
            callableStatement.setString(5, "01044444444");
            callableStatement.setString(6, "가락동");
            callableStatement.setInt(7, 4);

            callableStatement.executeUpdate();
            log.info("Update complete");



        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testPackageDelete(){

        log.info("Package Delete 실행중");
        String runSp= "{call pack_order.proc_order_delete(?) }";
        Connection con=null;

        try{
            conn=dataSource.getConnection();
            CallableStatement callableStatement=conn.prepareCall(runSp);
            callableStatement.setLong(1, 11);
            callableStatement.executeUpdate();
            log.info("delete complete");

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Test
    public void testSelectOne(){


        log.info("test Select One 중");

        String runSp="{call pack_order.PROC_ORDER_SELECT(?,?)}";
        conn=null;
        ArrayList<OrderVO> list=new ArrayList<>();

        try{
            conn=dataSource.getConnection();
            CallableStatement callableStatement=conn.prepareCall(runSp);

            callableStatement.setLong(1,19);
            callableStatement.registerOutParameter(2, OracleTypes.CURSOR);
            callableStatement.execute();

            ResultSet resultSet = (ResultSet) callableStatement.getObject(2);

            while(resultSet.next()){
                OrderVO order=new OrderVO();
                order.setPoint(resultSet.getLong("order_point"));
                order.setSeq(resultSet.getLong("order_seq"));
                order.setStatus(resultSet.getString("order_status"));
                order.setDelivery(resultSet.getString("order_delivery"));
                order.setUserName(resultSet.getString("order_user_name"));
                order.setUserNumber(resultSet.getString("order_user_number"));
                order.setUser_seq(resultSet.getLong("user_seq"));
                order.setCreatedAt(resultSet.getDate("created_at"));
                order.setUpdatedAt(resultSet.getDate("updated_at"));
                order.setInvoice(resultSet.getLong("order_invoice"));

                list.add(order);
            }
            for(OrderVO vo:list){
                log.info(vo);
            }

            log.info("test 성공");
            callableStatement.close();
            conn.close();

        }catch (SQLException e){
            e.printStackTrace();
        }
    }


}