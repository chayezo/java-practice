package kr.or.iei;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

public class Application4 {
	
	private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:XE";
	private static final String DB_USER = "system";
	private static final String DB_PASS = "12345";
	
	public static void main(String[] args) throws ClassNotFoundException {
		// 1. 클래스 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		// 2. 데이터베이스에 접속
		try (final Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
		// 3. 데이터베이스 작업
			final String sql = "SELECT * FROM jdbc_example WHERE id = 5";
			final PreparedStatement pstmt = conn.prepareStatement(sql);
			final ResultSet rs = pstmt.executeQuery();	//rs- BOF
			rs.next();	
			// 다음행으로 이동.
			// next 반환값은 boolean.
			
			//---------------------------------------------
			final int id = rs.getInt("id");
			final String name = rs.getString("name");
			final LocalDateTime time = rs.getTimestamp("time").toLocalDateTime();
			final String email = rs.getString("email");
			//---------------------------------------------
			
			System.out.println(id);
			System.out.println(name);
			System.out.println(time);
			System.out.println(email);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
