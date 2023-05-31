package member1;

import java.sql.*;
import java.util.*;

public class MemberDAO {
	
	private String url = "jdbc:oracle:thin:@192.168.1.100:1521:xe";
	private String user = "c##itbank";
	private String password = "it";
	
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	public MemberDAO() throws ClassNotFoundException {
		Class.forName("oracle.jdbc.driver.OracleDriver");
	}
	
	public List<MemberDTO> selectAll() throws SQLException {
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		// 2-1) MemberDTO 의 형태가 결정되어 있어야 한다
		//		member 테이블의 컬럼 구조와 일치하는 형태로 작성해야 한다
		//		자바 빈즈 규약에 맞게 작성해야 한다
		
		// 2-2) 함수의 목적에 맞는 SQL문을 작성한다
		String sql = "select * from member1 order by idx";
		
		// 2-3) select라면 executeQuery(), 그 외에는 executeUpdate()로 실행한다
		conn = DriverManager.getConnection(url, user, password);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			MemberDTO dto = new MemberDTO();
			dto.setIdx(rs.getInt("idx"));
			dto.setUserid(rs.getString("userid"));
			dto.setUserpw(rs.getString("userpw"));
			dto.setUsername(rs.getString("username"));
			dto.setEmail(rs.getString("email"));
			dto.setBirth(rs.getString("birth"));
			dto.setGender(rs.getString("gender"));
			dto.setAge(rs.getInt("age"));
			list.add(dto);
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		return list;
	}

}
