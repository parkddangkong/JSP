package day07;

import java.sql.*;
import java.util.*;

public class ScheduleDAO {

	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	private String url = "jdbc:oracle:thin:@192.168.1.100:1521:xe";
	private String user = "c##itbank";
	private String password = "it";
	
	
	public ScheduleDAO() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
	}
	
	public List<ScheduleDTO> selectAll() throws SQLException {
		List<ScheduleDTO> list = new ArrayList<ScheduleDTO>();
		
		String sql = "select * from schedule order by idx";
		
		conn = DriverManager.getConnection(url, user, password);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			ScheduleDTO dto = new ScheduleDTO();
			dto.setIdx(rs.getInt("idx"));
			dto.setTitle(rs.getString("title"));
			dto.setMemo(rs.getString("memo"));
			dto.setSdate(rs.getString("sdate"));
			list.add(dto);
		}
		rs.close();
		stmt.close();
		conn.close();
		
		return list;
	}
	
	public int insert(ScheduleDTO dto) throws SQLException{
		int row = 0;
		String sql = "insert into schedule (sdate, title, memo) values ('%s','%s','%s')";
		sql = String.format(sql,dto.getSdate(), dto.getTitle(),dto.getMemo());
		
		conn = DriverManager.getConnection(url, user, password);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		stmt.close();
		conn.close();
		return row;
	}
	
	public int delete(int idx) throws SQLException{
		int row = 0;
		String sql = "delete schedule where idx = "+idx;
		
		conn = DriverManager.getConnection(url, user, password);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		stmt.close();
		conn.close();
		return row;
	}

}
