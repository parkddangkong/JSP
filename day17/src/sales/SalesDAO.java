package sales;

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

public class SalesDAO {

	private Connection conn;		
	private PreparedStatement pstmt;
	private ResultSet rs;			
	
	private Context init;			
	private DataSource ds;			
	
	private static SalesDAO instance = new SalesDAO();
	
	public static SalesDAO getInstance() {
		return instance;
	}
	
	private SalesDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	// 매출 목록
	public List<SalesDTO> select() {
		ArrayList<SalesDTO> list = new ArrayList<SalesDTO>();
//		String sql = "select * from sales order by idx";
		String sql = "select S.*, P.name, P.price from sales S" + 
				"    join product P" + 
				"        on S.product = P.idx order by S.idx";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SalesDTO dto = new SalesDTO();
				dto.setIdx(rs.getInt(1));
				dto.setProduct(rs.getInt(2));
				dto.setsDate(rs.getDate(3));
				dto.setCnt(rs.getInt(4));
				dto.setName(rs.getString(5));	// 조인에 의한 추가 컬럼
				dto.setPrice(rs.getInt(6));		// 조인에 의한 추가 컬럼
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try { if(rs != null) 	rs.close(); } 		catch(Exception e) {}
			try { if(pstmt != null) pstmt.close(); } 	catch(Exception e) {}
			try { if(conn != null) 	conn.close(); } 	catch(Exception e) {}
		}
		return list;
	}
	
	public int insert(SalesDTO dto) {
		int row = 0;
		String sql = "insert into sales (product, cnt) values (?, ?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getProduct());
			pstmt.setInt(2, dto.getCnt());
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try { if(rs != null) 	rs.close(); } 		catch(Exception e) {}
			try { if(pstmt != null) pstmt.close(); } 	catch(Exception e) {}
			try { if(conn != null) 	conn.close(); } 	catch(Exception e) {}
		}
		return row;
	}
	
	
	
	
	
	
	
	
	
	
}
