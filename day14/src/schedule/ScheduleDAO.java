package schedule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ScheduleDAO {
	// 필드
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	// 싱글톤
	private static ScheduleDAO instance = new ScheduleDAO();
	
	public static ScheduleDAO getInstance() {
		return instance;
	}
	
	private ScheduleDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public List<ScheduleDTO> selectAll() {
		ArrayList<ScheduleDTO> list = new ArrayList<ScheduleDTO>();
		String sql = "select title, sdate, edate, edate - sdate + 1 as days from schedule2 order by sdate";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ScheduleDTO dto = new ScheduleDTO();
				dto.setDays(rs.getInt("days"));
				dto.setEdate(rs.getDate("edate"));
				dto.setSdate(rs.getDate("sdate"));
				dto.setTitle(rs.getString("title"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {}
		}
		return list;
	}

	public int insert(ScheduleDTO dto) {
		int row = 0;
		String sql = "insert into schedule2 values (?, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setDate(2, dto.getSdate());
			pstmt.setDate(3, dto.getEdate());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {}
		}
		return row;
	}

}
