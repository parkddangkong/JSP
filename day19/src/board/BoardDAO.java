package board;

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

public class BoardDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	private static BoardDAO instance = new BoardDAO();
	
	public static BoardDAO getInstance() {
		return instance;
	}
	
	public BoardDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private void close() {
		try { if(rs != null) 	rs.close(); } 		catch(Exception e) {}
		try { if(pstmt != null) pstmt.close(); } 	catch(Exception e) {}
		try { if(conn != null) 	conn.close(); } 	catch(Exception e) {}
	}
	
	private BoardDTO mapping(ResultSet rs) throws SQLException {
		BoardDTO dto = new BoardDTO();
		dto.setIdx(rs.getInt("idx"));
		dto.setTitle(rs.getString("title"));
		dto.setWriter(rs.getInt("writer"));
		dto.setContent(rs.getString("content"));
		dto.setFileName(rs.getString("fileName"));
		dto.setIpaddr(rs.getString("ipaddr"));
		dto.setUserAgent(rs.getString("userAgent"));
		dto.setWriteDate(rs.getDate("writeDate"));
		
		dto.setUserid(rs.getString("userid"));
		
		return dto;
	}
	
	public List<BoardDTO> select(String column, String search) {
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
			
		String sql = "select M.userid, B.* from board B" + 
						"    join member M" + 
						"       on M.idx = B.writer";
		
		String like = " and %s like '%%' || ? || '%%' ";
		column = column.equals("writer") ? "M.userid" : "B." + column; 
		like = String.format(like, column);
		
		String order = " order by B.idx desc";
		boolean flag = "".equals(column) == false && "".equals(search) == false;
		
		sql += flag ? like + order : order; 
//		System.out.println(flag + ", " + sql);
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			if(flag) {
				pstmt.setString(1, search);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(mapping(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		return list;
	}
	
	public int insert(BoardDTO dto) {
		int row = 0;
		String sql = "insert into board (writer, title, content, ipaddr, userAgent, fileName) "
				+ "values (?, ?, ?, ?, ?, ?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getIpaddr());
			pstmt.setString(5, dto.getUserAgent());
			pstmt.setString(6, dto.getFileName());
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
 		} finally { close(); }
		
		return row;
	}

	public BoardDTO selectOne(int idx) {
		BoardDTO dto = null;
		String sql = "select M.userid, B.* from board B "
				+ "	join member M on M.idx = B.writer "
				+ "where B.idx=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = mapping(rs);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		
		return dto;
	}

	public int delete(int idx, int writer) {
		int row = 0;
		String sql = "delete board where idx=? and writer=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.setInt(2, writer);
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		
		return row;
	}
}








