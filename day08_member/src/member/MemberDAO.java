package member;

import java.sql.*;

import java.util.ArrayList;
import java.util.List;

import javax.sql.*;
import javax.naming.*;

//1) 싱글톤 구현
//2) 커넥션 풀 연결
//3) patmt : SQL에서 파라미터가 많이 사용되리 경우, 순서대로 값을 넣어주는 객체

/*
 * 	stmt = conn.createStatement();
 * 	rs = stmt.exeQuteQuery(sql);
 * 
 * pstmt = conn.prepareStatement(sql);	// (자료형에 따라 쿼리문을 다르게 만들어준다)
 * pstmt.setString(1, dto.getName());	// 문자열은 자동으로 따옴표로 묶어준다
 * pstmt.setInt(2,dto.getAge());		// 숫자는 그냥 입력한다
 * rs = pstmt.executeQuery();			// 이미 쿼리문을 전달했기 때문에 인자를 추가로 전달하지 않는다
 * 
 * */
public class MemberDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;	// ResultSet 객체는 SELECT 문의 결과를 나타냄
	
	private Context init;
	private DataSource ds;
	
	// 생성자 대신 객체를 받는 함수 작성(객체가 없는 상태에서 객체를 받아야 하니 static으로 처리)
	public static MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return instance;
	}
	
	
	private MemberDAO() {	// 외부에서 생성자를 호출 못하게 private으로 변경
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");	
		} catch(NamingException e) {
			System.err.println("DAO 생성자 예외 발생 : "+ e);
//			e.printStackTrace();
		}
	}
	
	public String test() {
		String banner = "";
		String sql = "select banner from v$version";
		try {
			conn = ds.getConnection();
//			stmt = conn.prepareStatement();
			pstmt = conn.prepareStatement(sql);	// 미리 준비한 SQL을 넣어서 pstmt를 받는다
			
//			rs = stmt.executeQuery(sql);
			rs = pstmt.executeQuery();	// PreparedStatement 객체의 executeQuery() 메서드를 호출하여 ResultSet 객체를 반환
			
			while(rs.next()) {
				banner = rs.getString("banner");
			}
		} catch (SQLException e) {
			System.err.println(getClass().getSimpleName() + " : " + e);
//			e.printStackTrace();
		}finally {
			try{if(rs != null) rs.close();} catch(Exception e) {}
			try{if(pstmt != null) rs.close();} catch(Exception e) {}
			try{if(conn != null) rs.close();} catch(Exception e) {}
		}
		return banner;
	}
	
	// rs를 전달받아서, MemberDTO 하나를 반환하는 함수 (내부에서만 사용)
	private MemberDTO mapping(ResultSet rs) throws SQLException {
		MemberDTO dto = new MemberDTO();
		dto.setAge(rs.getInt("age"));
		dto.setBirth(rs.getString("birth"));
		dto.setEmail(rs.getString("email"));
		dto.setGender(rs.getString("gender"));
		dto.setIdx(rs.getInt("idx"));
		dto.setUserid(rs.getString("userid"));
		dto.setUsername(rs.getString("username"));
		dto.setUserpw(rs.getString("userpw"));
		return dto;
	}
	
	// 연결 해제(내부 사용)
	private void close() {
		try {if(rs != null) 	rs.close();} 	catch (Exception e)	{}
		try {if(pstmt != null) 	pstmt.close();} 	catch (Exception e)	{}
		try {if(conn != null) 	conn.close();} 	catch (Exception e)	{}
	}
	
	// 전체 목록
	public List<MemberDTO> selectAll(){
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		String sql = "select * from member1 order by idx";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);	// prepareStatement 가 모든 기능을 다 가지고 있음
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO dto = mapping(rs);
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		
		}
		return list;
	}
	

	// 추가
	public int insert(MemberDTO input) {
		int row = 0;
		String sql = "insert into member1 "
				+ "(userid, userpw, username, birth, email, gender, age)"
				+ "values (?, ?, ?, ?, ?, ?, ?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);	
			pstmt.setString(1, input.getUserid());	// 'test'
			pstmt.setString(2, input.getUserpw());
			pstmt.setString(3, input.getUsername());
			pstmt.setString(4, input.getBirth());
			pstmt.setString(5, input.getEmail());
			pstmt.setString(6, input.getGender());
			pstmt.setInt(7, input.getAge());		// 25
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		return row;
					
	}
	
	// idx로 단일 회원 조회하기
	public MemberDTO selectOne(int idx) {
		MemberDTO dto = null;	// new MemberDTO();
		String sql = "select * from member1 where idx=?";
		 try {
			 conn = ds.getConnection();
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setInt(1, idx);
			 rs = pstmt.executeQuery();
			 
			 if(rs.next()) {
				 dto = mapping(rs);
			 }
		 } catch (SQLException e) {
			 e.printStackTrace();
		 } finally {
			 close();
		 }
		 return dto;
	}
	
	// 삭제 함수(한승록)
	public int delete(int idx) {
		int row = 0;
		String sql = "delete member1 where idx=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);	// ? 개수만큼 값을 넣었는지 확인하자!!!
			row = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return row;
	}
	
	public int modify(MemberDTO dto) {
		int row = 0;
		String sql = "update member1 "
				+ " set userpw=?, suername=?, birth=?, email=?, gender=? age=? "
				+ " where userid=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserpw());
			pstmt.setString(2, dto.getUsername());
			pstmt.setString(3, dto.getBirth());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getGender());
			pstmt.setInt(6, dto.getAge());
			pstmt.setString(7, dto.getUserid());
			row = pstmt.executeUpdate();
		} catch (SQLException e){
			e.printStackTrace();
		}finally { 
			close(); }
		return row;
	}
}
