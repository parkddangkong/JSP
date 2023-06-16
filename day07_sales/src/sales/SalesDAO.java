package sales;

import java.sql.*;
import java.util.*;

public class SalesDAO {
	
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	private String url = "jdbc:oracle:thin:@192.168.1.100:1521:xe";
	private String user = "c##itbank";
	private String password = "it";
	
	
	public SalesDAO() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
	}
	
	public List<SalesDTO> selectAll() throws SQLException {
		List<SalesDTO> list = new ArrayList<SalesDTO>();
		
		String sql = "select * from sales order by idx";
		
		conn = DriverManager.getConnection(url, user, password);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			SalesDTO dto = new SalesDTO();
			dto.setIdx(rs.getString("idx"));
			dto.setName(rs.getString("name"));
			dto.setPrice(rs.getInt("price"));
			dto.setCnt(rs.getInt("cnt"));
			dto.setStatus(rs.getInt("status"));
			list.add(dto);
		}
		rs.close();
		stmt.close();
		conn.close();
		
		return list;
	}
	
	public int insert(SalesDTO dto) throws SQLException{
		int row = 0;
		String sql = "insert into sales (name, price, cnt) values ('%s',%d,%d)";
		sql = String.format(sql,dto.getName(), dto.getPrice(),dto.getCnt());
		
		conn = DriverManager.getConnection(url, user, password);
		stmt = conn.createStatement();
		row = stmt.executeUpdate(sql);
		
		stmt.close();
		conn.close();
		return row;
	}

}
