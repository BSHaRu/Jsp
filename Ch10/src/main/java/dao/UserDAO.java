package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dto.UserDTO;

public class UserDAO {
	
	private final String HOST = "jdbc:mysql://IP:3306/userdb";
	private final String USER = "user";
	private final String PASS = "비번";
	private final String DRIVER = "com.mysql.cj.jdbc.Driver";
	
	private Connection conn = null;
	private Statement stmt = null;
	private PreparedStatement psmt = null;
	private ResultSet rs = null;
	
	String sql = "";
	int result = 0;
	
	// 등록
	public void insertUser(UserDTO dto) {
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(HOST, USER, PASS);
			sql = "INSERT INTO user1 SET "
					+ " uid = ?, "
					+ " name = ?, "
					+ " hp = ?,"
					+ " age = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getUid());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getHp());
			psmt.setInt(4, dto.getAge());
			psmt.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			System.out.println("driver 에러");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(psmt != null)
				try {
					psmt.close();
				} catch (SQLException e) {}
			if(conn != null)
				try {
					conn.close();
				} catch (SQLException e) {}
		}
	}
	
	 
	public UserDTO selectUser(String uid) {
		UserDTO dto = null;
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(HOST, USER, PASS);
			sql = "SELECT * FROM user1 WHERE uid = ? ";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				dto = new UserDTO();
				dto.setUid(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setHp(rs.getString(3));
				dto.setAge(rs.getInt(4));
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs != null)
				try {
					rs.close();
				} catch (SQLException e) {}
			if(stmt != null)
				try {
					stmt.close();
				} catch (SQLException e) {}
			if(conn != null)
				try {
					conn.close();
				} catch (SQLException e) {}
		}
		return dto;
	}
	
	// 전체 목록 보기
	public List<UserDTO> selectUsers() {
		List<UserDTO> list = new ArrayList<>();
		
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(HOST, USER, PASS);
			stmt = conn.createStatement(); 
			sql = "SELECT * FROM user1 ";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				UserDTO dto = new UserDTO();
				dto.setUid(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setHp(rs.getString(3));
				dto.setAge(rs.getInt(4));
				list.add(dto);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs != null)
				try {
					rs.close();
				} catch (SQLException e) {}
			if(stmt != null)
				try {
					stmt.close();
				} catch (SQLException e) {}
			if(conn != null)
				try {
					conn.close();
				} catch (SQLException e) {}
		}
		return list;
	}
	
	// 수정
	public void updateUser(UserDTO dto) {
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(HOST, USER, PASS);
			sql = "UPDATE user1 SET "
					+ " name = ?, "
					+ " hp = ?, "
					+ " age = ? "
					+ " WHERE uid = ? ";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getHp());
			psmt.setInt(3, dto.getAge());
			psmt.setString(4, dto.getUid());
			psmt.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			System.out.println("driver 에러");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(psmt != null)
				try {
					psmt.close();
				} catch (SQLException e) {}
			if(conn != null)
				try {
					conn.close();
				} catch (SQLException e) {}
		}
	}
	
	// 삭제
	public void deleteUser(String uid) {
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(HOST, USER, PASS);
			sql = "DELETE FROM user1 WHERE uid = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, uid);
			psmt.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			System.out.println("driver 에러");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(psmt != null)
				try {
					psmt.close();
				} catch (SQLException e) {}
			if(conn != null)
				try {
					conn.close();
				} catch (SQLException e) {}
		}
	}
}
