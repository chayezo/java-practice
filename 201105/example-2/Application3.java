package kr.or.iei;	//INSERT

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Application3 {

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
			final String email = "a@b.com";
			final String sql = "INSERT INTO jdbc_example VALUES(seq_jdbc_example_pk.nextval, ? , DEFAULT, ?)";
			final PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);	//��ȣ �� 1�� --> parameterIndex
			pstmt.setString(2, email);
			final int affectedRows = pstmt.executeUpdate();
			System.out.println(affectedRows);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
