package product;

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

public class ProductDAO {

	private Connection conn;		
	private PreparedStatement pstmt;
	private ResultSet rs;			
	
	private Context init;			
	private DataSource ds;			
	
	private static ProductDAO instance = new ProductDAO();
	
	public static ProductDAO getInstance() {
		return instance;
	}
	
	private ProductDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}


	// 상품 등록
	public int insert(ProductDTO dto) {
		int row = 0;
		String sql = "insert into product (name, price) values (?, ?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setInt(2, dto.getPrice());
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

	// 상품 목록
	public List<ProductDTO> select() {
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		String sql = "select * from product order by idx";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setIdx(rs.getInt(1));
				dto.setName(rs.getString(2));
				dto.setPrice(rs.getInt(3));
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






}
