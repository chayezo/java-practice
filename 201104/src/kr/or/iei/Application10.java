package kr.or.iei;	//SELECT

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Application10 {

	private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:XE";
	private static final String DB_USER = "system";
	private static final String DB_PASS = "12345";
	
	public static void main(String[] args) throws ClassNotFoundException {
		// 1. 클래스 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		// 2. DB 접속
		try (final Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
			String sql = "SELECT empno as no, ename, job FROM emp";
			final PreparedStatement pstmt = conn.prepareStatement(sql);
			final ResultSet rs = pstmt.executeQuery();	//*****
			while(rs.next()) {
				final int empno = rs.getInt("no");	//컬럼 이름 그대로 가져와야함.
				final String ename = rs.getString("ename");
				final String job = rs.getString("job");
				System.out.println(empno);
				System.out.println(ename);
				System.out.println(job);
				System.out.println("========================");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
