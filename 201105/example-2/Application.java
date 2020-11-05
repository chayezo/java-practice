package kr.or.iei;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Application {

	public static void main(String[] args) throws ClassNotFoundException {
		// 1. jvm�� Ŭ���� �ε� (Oracle JDBC Driver)
		Class.forName("oracle.jdbc.driver.OracleDriver");

		// 2. ����̹� �Ŵ����κ��� Ŀ�ؼ� ����
		try (final Connection conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:XE"
				,"system", "12345"
				);
				// 3. �����ͺ��̽� �۾�
				final PreparedStatement pstmt = 
						conn.prepareStatement("SELECT 1 FROM dual");

				) {
			final ResultSet rs =	//query ����� ��� ��ü 
					pstmt.executeQuery();	// query ����
			rs.next();
			int value = rs.getInt(1);
			System.out.println(value);


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}


}
