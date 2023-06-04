package phone_number;

import java.sql.*;

import java.util.ArrayList;
import java.util.List;

import javax.sql.*;
import javax.naming.*;

public class Phone_numberDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private Context init;
	private DataSource ds;

	public static Phone_numberDAO instance = new Phone_numberDAO();

	public static Phone_numberDAO getInstance() {
		return instance;
	}

	private Phone_numberDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			System.err.println("DAO 생성자 예외 발생 : " + e);
		}
	}

	public String test() {
		String banner = "";
		String sql = "select banner from v$version";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				banner = rs.getString("banner");
			}
		} catch (SQLException e) {
			System.err.println(getClass().getSimpleName() + " : " + e);
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
			}
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return banner;
	}

	private Phone_numberDTO mapping(ResultSet rs) throws SQLException {
		Phone_numberDTO dto = new Phone_numberDTO();
		dto.setIdx(rs.getInt("idx"));
		dto.setName(rs.getString("name"));
		dto.setPnumber(rs.getString("pnumber"));
		dto.setBookmark(rs.getInt("bookmark"));
		return dto;
	}

	private void close() {
		try {
			if (rs != null)
				rs.close();
		} catch (Exception e) {
		}
		try {
			if (pstmt != null)
				pstmt.close();
		} catch (Exception e) {
		}
		try {
			if (conn != null)
				conn.close();
		} catch (Exception e) {
		}
	}

	public List<Phone_numberDTO> selectAll() {
		ArrayList<Phone_numberDTO> list = new ArrayList<Phone_numberDTO>();
		String sql = "select * from pnumber order by idx DESC";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Phone_numberDTO dto = mapping(rs);
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	public int insert(Phone_numberDTO input) {
		int row = 0;
		String sql = "insert into pnumber " + "(name, pnumber)" + "values (?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, input.getName());
			pstmt.setString(2, input.getPnumber());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return row;
	}

	public Phone_numberDTO selectOne(int idx) {
		Phone_numberDTO dto = null;
		String sql = "select * from pnumber where idx =?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = mapping(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}

	public int delete(int idx) {
		int row = 0;
		String sql = "delete pnumber where idx =?";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return row;
	}

	public int modify(Phone_numberDTO dto) {
		int row = 0;
		String sql = "update pnumber " + "set pnumber=? " + "where name=?";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPnumber());
			pstmt.setString(2, dto.getName());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return row;
	}

	public void bookmark(int idx) {
		String sql = "update pnumber set bookmark = bookmark * -1 where idx=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
}
