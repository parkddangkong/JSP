package youtube;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.*;

public class YoutubeDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	private static YoutubeDAO instance = new YoutubeDAO();
	
	public static YoutubeDAO getInstance() {
		return instance;
	}
	
	private YoutubeDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			System.out.println("DAO 생성자 예외 : " + e);
			e.printStackTrace();
		}
	}
	
	// 목록 (idx순)
	public ArrayList<YoutubeDTO> selectAll() {
		ArrayList<YoutubeDTO> list = new ArrayList<YoutubeDTO>();
		String sql = "select * from youtube_list order by idx";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				YoutubeDTO dto = mapping(rs);
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		return list;
	}
	
	// 단일조회
	public YoutubeDTO select(int idx) {
		YoutubeDTO dto = null;
		String sql = "select * from youtube_list where idx = ?";
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

	// 추가
	public int insert(YoutubeDTO dto) {
		String title = dto.getIframe().substring(dto.getIframe().indexOf("title=\""));
		title = title.replace("title=\"", "");
		title = title.substring(0, title.indexOf("\""));
		dto.setTitle(title);
		
		int row = 0;
		String sql = "insert into youtube_list (title, channel, thumbnail, iframe) values (?, ?, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getChannel());
			pstmt.setString(3, dto.getThumbnail());
			pstmt.setString(4, dto.getIframe());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		return row;
	}
	
	// 최근 목록만 불러오기
	public ArrayList<YoutubeDTO> selectList(String recent) {
		ArrayList<YoutubeDTO> list = new ArrayList<YoutubeDTO>();
		if(recent.equals("")) {
			return list;
		}
		
		recent = recent.replace(" " , "");
		String[] arr = recent.split(",");
		System.out.println(Arrays.toString(arr));
		
		for(int i = 0; i < arr.length; i++) {
			String idx = arr[i];
			list.add(select(Integer.parseInt(idx)));
		}
		return list;
	}
	
	private void close() {
		try { if(rs != null) rs.close(); } catch(Exception e) {}
		try { if(pstmt != null) pstmt.close(); } catch(Exception e) {}
		try { if(conn != null) conn.close(); } catch(Exception e) {}
	}

	private YoutubeDTO mapping(ResultSet rs) throws SQLException {
		YoutubeDTO dto = new YoutubeDTO();
		dto.setIdx(rs.getInt("idx"));
		dto.setTitle(rs.getString("title"));
		dto.setChannel(rs.getString("channel"));
		dto.setThumbnail(rs.getString("thumbnail"));
		dto.setIframe(rs.getString("iframe"));
		return dto;
	}
}
