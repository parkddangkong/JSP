package ex07;

// DAO : Data Access Object
// 저장된 데이터에 접근하여 (데이터베이스에 접근하여) 
// 조회, 추가, 수정, 삭제 등을 수행하는 객체
// 각 기능은 함수로 구현한다
// DB에 접근할 수 있는 JDBC요소가 포함되어야 한다

import java.sql.*;
import java.util.*;

public class StudentDAO {
	
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	private String url = "jdbc:oracle:thin:@192.168.1.100:1521:xe";
	private String user = "c##itbank";
	private String password = "it";
	
	public StudentDAO() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
	}
	
	// 접속 확인
	public String test() throws SQLException {
		String result = null;
		
		String sql = "select banner from v$version";
		conn = DriverManager.getConnection(url, user, password);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			result = rs.getString("banner");
		}
		
		rs.close();
		stmt.close();
		conn.close();
		return result;
	}

	// 검색 목록 불러오기
	public List<StudentDTO> search(String param) throws SQLException {
		ArrayList<StudentDTO> list = new ArrayList<>();
		String sql = "select * from student "
				+ "where name like '%%%s%%' "
				+ "order by name";
		sql = String.format(sql, param);
		
		conn = DriverManager.getConnection(url, user, password);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			StudentDTO dto = new StudentDTO();
			String name = rs.getString("name");
			int age = rs.getInt("age");
			String gender = rs.getString("gender");
			dto.setName(name);
			dto.setAge(age);
			dto.setGender(gender);
			list.add(dto);
		}
		rs.close();
		stmt.close();
		conn.close();
		return list;
	}
	
	
}









