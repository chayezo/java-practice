package kr.or.iei.exam;
import java.util.*;
import java.sql.*;

public class Dao {
	   public int update(Memo m) {
	      Connection conn = null;
	      PreparedStatement pstmt = null;      
	      int result = 0;
	      String query = "update memo set name = ?, msg = ? where no = ?";
	      try {
	         Class.forName("oracle.jdbc.driver.OracleDriver");
	         conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "system", "12345");
	         pstmt = conn.prepareStatement(query);
	         pstmt.setString(1, m.getName());
	         pstmt.setString(2, m.getMsg());
	         pstmt.setInt(3, m.getNo());
	         result = pstmt.executeUpdate();   
	         System.out.println(result);
	         
	         conn.commit();
	      } catch (ClassNotFoundException | SQLException e) {
	         e.printStackTrace();
	         try {
	            conn.rollback();
	         } catch (SQLException throwables) {
	            throwables.printStackTrace();
	         }
	      } finally {
	         try {
	            pstmt.close();
	            conn.close();
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }

	      return result;
	   }
	}
