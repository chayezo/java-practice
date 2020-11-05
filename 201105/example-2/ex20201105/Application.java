package kr.or.iei.ex20201105;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Application {
	
	private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private static final String DB_USER = "system";
    private static final String DB_PASS = "12345";

	public static void main(String[] args) throws ClassNotFoundException {
		// 1. 드라이버 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		// 2. 커넥션 요청
		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
		// 3.1. DB작업 - DQL
			select(conn);
		// 3.2. DB작업 - DML
		} catch (SQLException e) {
			e.printStackTrace();
		} 

	}
	
	private static void dml(Connection conn) {
		final String sql = "" +
				"INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)\n" +
                "VALUES (8000, ?, ?, 7698, SYSDATE, ?, ?, ?)";
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, "yejin");		// .setObject -> 이렇게 사용해도 됨.
			pstmt.setString(2, "MANAGER");
			pstmt.setDouble(3, 1500.0);
			pstmt.setDouble(4, 0.0);
			pstmt.setInt(5, 30);
			pstmt.executeUpdate();
			final int affectedRows = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	private static void select(Connection conn) {
		final String sql = "SELECT * FROM emp";
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			final ResultSet rs = pstmt.executeQuery();
			// bof, eof
			while(rs.next()) {
				final int empno = rs.getInt("empno");
				final String ename = rs.getString("ename");
				final Integer sal = rs.getInt("sal");
				final Integer comm = rs.getInt("comm");
				System.out.println(empno);
				System.out.println(ename);
				System.out.println(sal);
				System.out.println(comm);
				System.out.println("===========================");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
	}

}
