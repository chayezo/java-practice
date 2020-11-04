package kr.or.iei;//statement���.

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Application2 {
	public static void main(String[] args) throws ClassNotFoundException {
		// 1. jvm�� Ŭ���� �ε� (Oracle JDBC Driver)
		Class.forName("oracle.jdbc.driver.OracleDriver");

		// 2. ����̹� �Ŵ����κ��� Ŀ�ؼ� ����
		try (final Connection conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:XE"
				,"system", "12345"
				);

		) {
			final String name = "abc";
			final String sqlFormat = "INSERT INTO jdbc_example VALUES(seq_jdbc_example_pk.nextval, '%s', DEFAULT)";
			final String sql = String.format(sqlFormat, name);
			Statement statement = conn.createStatement();
			final int affectedRows = statement.executeUpdate(sql);
			System.out.println(affectedRows);


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}


