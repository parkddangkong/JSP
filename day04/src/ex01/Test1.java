package ex01;

//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.sql.Statement;
import java.sql.*;

import oracle.jdbc.driver.OracleDriver;

public class Test1 {
	static String getVersion() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
		String version = null;
		String sql = "select banner from v$version";
		String url = "jdbc:oracle:thin:@192.168.1.100:1521:xe";
		String user = "c##itbank";
		String password = "it";
		
		Class<?> driverClass = Class.forName("oracle.jdbc.driver.OracleDriver");
		OracleDriver driverInstance = (OracleDriver) driverClass.newInstance();
		// 클래스 정보를 불러와서, 클래스의 기본생성자를 호출하여 객체를 생성하는 코드
		// 여기서는 샘플로만 활용. 이후 jsp model 2에서 실제로 활용한다
		System.out.println(driverInstance);
				
		Connection conn = DriverManager.getConnection(url, user, password);
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			version = rs.getString("banner");
		}
		rs.close();
		stmt.close();
		conn.close();
		return version;
	}
	
	public static void main(String[] args) throws Exception {
		String version = getVersion();
		System.out.println(version);
	}
}

