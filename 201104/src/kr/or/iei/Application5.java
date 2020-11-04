package kr.or.iei;	//SELECT

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class Application5 {

	private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:XE";
	private static final String DB_USER = "system";
	private static final String DB_PASS = "12345";

	public static void main(String[] args) throws ClassNotFoundException {
		// 1. 클래스 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");

		// 2. 데이터베이스에 접속
		try (final Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {

			// 3. 데이터베이스 작업
			final String sql = "SELECT * FROM jdbc_example";
			final PreparedStatement pstmt = conn.prepareStatement(sql);
			final ResultSet rs = pstmt.executeQuery();

			final List<JdbcExample> list = new ArrayList<>();
			while (rs.next()) {
				final JdbcExample jdbcExample = read(rs);
				list.add(jdbcExample);
			}

			for (JdbcExample jdbcExample : list) {
				System.out.println(jdbcExample);
			}


		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private static JdbcExample read(ResultSet rs) throws SQLException {
		final long id = rs.getLong("id");
		final String name = rs.getString("name");
		final LocalDateTime time = rs.getTimestamp("time").toLocalDateTime();
		final String email = rs.getString("email");
		return new JdbcExample(id, name, time, email);
	}

}
