package ex02;


import java.sql.*;


public class TestDAO {
	
	// 필드
	private Connection conn;
	private Statement stmt;;
	private ResultSet rs;
	
	private final String url = "jdbc:oracle:thin:@192.168.1.100:1521:xe";
	private final String user = "c##itbank";
	private final String password = "it";
	
	// 생성자
	public TestDAO() throws ClassNotFoundException, SQLException {	// 기본생성자
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url,user,password);
	}
	
	// 메서드
	public String getVersion() throws SQLException {
		String version = null;
		String sql = "select banner from v$version";
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			version = rs.getString("banner");
		}
		rs.close();
		stmt.close();
//		conn.close();
		return version;
	}
	
	public void close() throws SQLException{
		conn.close();
	}
}
	


