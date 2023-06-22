package phonebook;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.sql.*;
import javax.naming.*;


public class PhoneBookDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	private static PhoneBookDAO instance = new PhoneBookDAO();
	
	public static PhoneBookDAO getInstance() {
		return instance;
	}
	
	private PhoneBookDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
			
		} catch (NamingException e) {
			System.out.println("DAO 생성자 예외 발생 : " + e);
			e.printStackTrace();
		}
	}
	private void close() {
		try { if(rs != null) rs.close(); } catch(Exception e) {}
		try { if(pstmt != null) pstmt.close(); } catch(Exception e) {}
		try { if(conn != null) conn.close(); } catch(Exception e) {}
	}
	
	private PhoneBookDTO mapping(ResultSet rs) throws SQLException {
		PhoneBookDTO dto = new PhoneBookDTO();
		dto.setBookmark(rs.getInt("bookmark"));
		dto.setIdx(rs.getInt("idx"));
		dto.setName(rs.getString("name"));
		dto.setPnum(rs.getString("pnum"));
		return dto;
	}
	
	public List<PhoneBookDTO> selectAll() {
		ArrayList<PhoneBookDTO> list = new ArrayList<PhoneBookDTO>();
		String sql = "select * from phonebook order by bookmark, idx";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PhoneBookDTO dto = mapping(rs);
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { 
			close();
		}
		return list;
	}
	
}
