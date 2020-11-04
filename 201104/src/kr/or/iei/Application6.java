package kr.or.iei;	//UPDATE

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Application6 {
	private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:XE";
	private static final String DB_USER = "system";
	private static final String DB_PASS = "12345";
	
	public static void main(String[] args) throws ClassNotFoundException {
		// 1. 클래스 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		// 2. 데이터베이스에 접속
		try (final Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
		// 3. 데이터베이스 작업			
			final String sql = "UPDATE jdbc_example SET name = ? WHERE 1 = 1";
			final PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "java");
			final int affectedRows = pstmt.executeUpdate();
			System.out.println(affectedRows);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
