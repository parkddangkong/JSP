package test;

import java.sql.*;
import javax.sql.*;

public class DBCP_Sample {
	public static void main(String[] args) throws SQLException {
		/*** context.xml 에서 DataSource 객체를 준비하는 과정 ***/
		
		OracleDataSource ods = new OracleDataSource();	
		// type="javax.sql.DataSource"
		// name="jdbc/oracle"
		
		ods.setDriverType("oracle.jdbc.driver.OracleDriver");	
		ods.setURL("jdbc:oracle:thin:@192.168.1.100:1521:xe");	
		ods.setUser("c##itbank");	
		ods.setPassword("it");
		ods.setDataSourceName("jdbc/oracle");
		
		// driverClassName=""
		// url =""
		// username = ""
		// password = ""
		
		
		/*** DAO 클래스에서 initalContext() 를 참조하여 객체를 필드에 불러오는 과정 ***/
		DataSource ds = null; 
		ds = ods;	// ds = init.lookup("jdbc/oracle");
		
		String sql = "select banner from v$version";
		Connection conn = ds.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			System.out.println(rs.getString(1));
		}
		rs.close();
		pstmt.close();
		conn.close();
	}

}
