package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.UserDTO;
import util.*;

public class UserDAO extends DBCP {
	
	public static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {
		return instance;
	}
	private UserDAO() {}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	int result = 0;
	
	public void insertUser(UserDTO dto) {
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.INSERT_USER);
			psmt.setString(1, dto.getUid());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getNick());
			psmt.setString(5, dto.getEmail());
			psmt.setString(6, dto.getHp());
			psmt.setString(7, dto.getZip());
			psmt.setString(8, dto.getAddr1());
			psmt.setString(9, dto.getAddr2());
			psmt.setString(10, dto.getRegIp());
			psmt.executeUpdate();
		} catch (SQLException e) {
			logger.error("insertUser : " + e.getMessage());
		} finally {
			close(psmt, conn);
		}
	}
	
	
	public int checkUid(String uid) {
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.CHECK_UID);
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			
			if(rs.next()) result = rs.getInt(1);
		} catch (SQLException e) {
			logger.error("checkUid : " + e.getMessage());
		}finally {
			close(rs,psmt,conn);
		}
		return result;
	}
	
	public int checkNick(String nick) {
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.CHECK_NICK);
			psmt.setString(1, nick);
			rs = psmt.executeQuery();
			
			if(rs.next()) result = rs.getInt(1);
		} catch (SQLException e) {
			logger.error("checkNick : " + e.getMessage());
		}finally {
			close(rs, psmt, conn);
		}
		return result;
	}
	
	public int checkEmail(String email) {
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.CHECK_EMAIL);
			psmt.setString(1, email);
			rs = psmt.executeQuery();
			
			if(rs.next()) result = rs.getInt(1);
			logger.info("checkEmail result : " + result);
		} catch (SQLException e) {
			logger.error("checkNick : " + e.getMessage());
		}finally {
			close(rs, psmt, conn);
		}
		return result;
	}
	public int checkNameAndEmail(String name, String email) {
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.CHECK_NAME_EMAIL);
			psmt.setString(1, name);
			psmt.setString(2, email);
			rs = psmt.executeQuery();
			
			if(rs.next()) result = rs.getInt(1);
			logger.info("result 더러운값 : " + result);
		} catch (SQLException e) {
			logger.error("checkNick : " + e.getMessage());
		}finally {
			close(rs, psmt, conn);
		}
		return result;
	}
	
	public int checkHp(String hp) {
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.CHECK_HP);
			psmt.setString(1, hp);
			rs = psmt.executeQuery();
			
			if(rs.next()) result = rs.getInt(1);
		} catch (SQLException e) {
			logger.error("checkHp : " + e.getMessage());
		}finally {
			close(rs, psmt, conn);
		}
		return result;
	}
	
	public UserDTO selectUser(String uid, String pass) {
		UserDTO dto = null;
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.SELECT_USER);
			psmt.setString(1, uid);
			psmt.setString(2, pass);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto = new UserDTO();
				dto = getUser(rs);
			}
		} catch (SQLException e) {
			logger.error("selectUser : " + e.getMessage());
		}finally {
			close(rs, psmt, conn);
		}
		return dto;
	}
	
	// 이메일 인증 -> 필요없는거 같은데..?
	public int findIdForEmail(String name, String email) {
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.FIND_ID_FOR_EMAIL);
			psmt.setString(1, name);
			psmt.setString(2, email);
			rs = psmt.executeQuery();
			
			if(rs.next()) result = rs.getInt(1);
		} catch (SQLException e) {
			logger.error("findIdForEmail : " + e.getMessage());
		}finally {
			close(rs, psmt, conn);
		}
		return result;
	}
	
	// 이메일 인증 후 id 찾기 결과 값 조회
	public UserDTO findIdForEmailInResult(String name, String email) {
		UserDTO dto = null;
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.FIND_ID_FOR_EMAIL_IN_RESULT);
			psmt.setString(1, name);
			psmt.setString(2, email);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto = new UserDTO();
				dto = getUser(rs);
			}
		} catch (SQLException e) {
			logger.error("findIdForEmailInResult : " + e.getMessage());
		}finally {
			close(rs, psmt, conn);
		}
		return dto;
	}
	
	public List<UserDTO> selectUsers() {
		List<UserDTO> list = new ArrayList<>();
		
		
		return list;
	}
	
	public void updateUser(UserDTO dto) {
		
	}
	
	
	public int updateUserPass(String uid, String pass) {
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.UPDATE_USER_PASS);
			psmt.setString(1, uid);
			psmt.setString(2, pass);
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			logger.error("updateUserPass : " + e.getMessage());
		}finally {
			close(psmt, conn);
		}
		return result;
	}
	
	// 회원 탈퇴 -> id랑 leavedate는 남기고 나머지 개인정보만 삭제(null)
	public int updateUserForWithdraw(String uid) {
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.UPDATE_USER_FOR_WITHDRAW);
			psmt.setString(1, uid);
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			logger.error("updateUserForWithdraw : " + e.getMessage());
		}finally {
			close(psmt, conn);
		}
		return result;
	}
	
	public void deleteUser(String uid) {
		
		
	}
	
	
	
	public UserDTO getUser(ResultSet rs) {
		UserDTO dto = null;
		try {
			dto = new UserDTO();
			dto.setUid(rs.getString(1));
			dto.setPass(rs.getString(2));
			dto.setName(rs.getString(3));
			dto.setNick(rs.getString(4));
			dto.setEmail(rs.getString(5));
			dto.setHp(rs.getString(6));
			dto.setRole(rs.getString(7));
			dto.setZip(rs.getString(8));
			dto.setAddr1(rs.getString(9));
			dto.setAddr2(rs.getString(10));
			dto.setRegDate(rs.getDate("regDate"));
		}catch (Exception e) {}
		return dto;
	}
	
}
