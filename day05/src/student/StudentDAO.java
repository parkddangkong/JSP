package student;

import java.awt.print.Printable;

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

		while (rs.next()) {
			result = rs.getString("banner");
		}

		rs.close();
		stmt.close();
		conn.close();
		return result;
	}

	// 전체 목록 불러오기(이름 순)
	public List<StudentDTO> selectAll() throws SQLException {
		ArrayList<StudentDTO> list = new ArrayList<>();
		String sql = "select * from student order by name";

		conn = DriverManager.getConnection(url, user, password);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);

		while (rs.next()) {
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

	// 추가
	public int insert(StudentDTO dto) throws SQLException {
		int row = 0;
		String sql = "insert into student values('%s',%d, '%s')";
		sql = String.format(sql, dto.getName(), dto.getAge(), dto.getGender());

		conn = DriverManager.getConnection(url, user, password);
		stmt = conn.createStatement();
		row = stmt.executeUpdate(sql);

		stmt.close();
		conn.close();

		// ResultSet executeQuery(String sql) { ... } // select
		// int executeUpdate(String sql) { ... } // insert, update, delete

		return row;
	}
	
	
	// 삭제
	public int delete(String name) throws SQLException{
		int row = 0;
		String sql = "delete student where name = '%s'";
		sql = String.format(sql, name);
		
		conn = DriverManager.getConnection(url, user, password);
		stmt = conn.createStatement();
		row = stmt.executeUpdate(sql);

		stmt.close();
		conn.close();
		
		// JDBC에서는 auto commit이 기본이다
		// SQLDeveloper에서는 commit 혹은 rollback을 해야 트랜잭션이 종료된다
		
		return row;
	}
	
	// 단일데이터 불러오기
	public StudentDTO selectOne(String name) throws SQLException{
		StudentDTO dto = null;
		String sql = "select name, age, gender from student where name ='%s'";
		sql = String.format(sql, name);
		
		conn = DriverManager.getConnection(url, user, password);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			dto = new StudentDTO();
			dto.setName(rs.getString("name"));
			dto.setAge(rs.getInt("age"));
			dto.setGender(rs.getString("gender"));
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		return dto;
	}
	
	// 수정하기
	public int modify(StudentDTO dto) throws SQLException{
		
		int row = 0;
		String sql = "update student set age = %s, gender = '%s', where name = '%s'";
		sql = String.format(sql, dto.getAge(), dto.getGender(),dto.getName());
		
		conn = DriverManager.getConnection(url, user, password);
		stmt = conn.createStatement();
		row = stmt.executeUpdate(sql);
		
		stmt.close();
		conn.close();
		
		return row;
	}
	
	
}
