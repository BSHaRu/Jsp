package dao;

import java.sql.*;
import java.util.*;

import util.*;
import vo.*;

public class UserDAO {

	private static UserDAO instance = new UserDAO();
	
	public static UserDAO getInstance() {
		return instance;
	}
	private UserDAO() {}
		
	Connection conn = null;
	PreparedStatement psmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	
//	int result = 0;
//	int success = 1;
//	int fail = 0;
//	(result > 1) ? success : fail;
	public void insertUser(UserVO vo) {

		try {
			conn = DBCP.getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_USER);
			psmt.setString(1, vo.getuId());
			psmt.setString(2, vo.getPw());
			psmt.setString(3, vo.getuNick());
			psmt.setString(4, vo.getuPhone());
			psmt.setString(5, vo.getuEmail());
			psmt.setString(6, (vo.getuDate()));
			psmt.setString(7, vo.getGender());
			psmt.setString(8, vo.getuAddr1());
			psmt.setString(9, vo.getuAddr2());
			psmt.setString(10, vo.getuAddr3());
			
		} catch (SQLException e) {
			System.out.println("insertUser : " + e.getMessage());
//			return result;
		} finally {
			DBCP.close(rs, psmt, conn);
		}
//		return result;
	}
	
	public void selectUser() {
		
	}
	
	public void selectUsers() {
		
	}
	
	public void updateUser() {
		
	}
	
	public void deleteUser() {
		
	}
	
	public UserVO getUser(ResultSet rs) {
		UserVO vo = null;
		try {
			vo = new UserVO();
			
		}catch(Exception e) {
			System.out.println("getUser : " + e.getMessage());
		}
		return vo;
	}
}
