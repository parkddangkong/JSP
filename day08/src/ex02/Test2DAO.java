package ex02;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;


public class Test2DAO {
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	public Test2DAO() throws NamingException{
		init = new InitialContext();
		ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
	}
	
	// DB 버전 반환
	public String getVersion() throws SQLException {
		String version = null;
		String sql = "select banner from v$version";
		
		// DataSource : 여러개의 connection을 가지고 있다가 요청받으면 하나씩 내어줌
		conn = ds.getConnection();
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			version = rs.getString("banner");
		}
		rs.close();
		stmt.close();
		conn.close();
		return version;
		
	}

}
