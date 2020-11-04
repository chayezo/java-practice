package kr.or.iei;	//UPDATE

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Application11 {

	private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:XE";
	private static final String DB_USER = "system";
	private static final String DB_PASS = "12345";

	public static void main(String[] args) throws ClassNotFoundException {
		// 1. Ŭ���� �ε�
		Class.forName("oracle.jdbc.driver.OracleDriver");

		// 2. DB ����
		try (final Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
			String sql = "UPDATE emp SET comm = 0 WHERE comm is null";
			final PreparedStatement pstmt = conn.prepareStatement(sql);
			final int affectedRows = pstmt.executeUpdate();
			System.out.println(affectedRows);

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}


