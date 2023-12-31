package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.UserDTO;
import util.DBCP;
import util.SQL;

public class UserDAO extends DBCP{

	private static UserDAO instance = new UserDAO();
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
			logger.info("insertUser dto : " + dto);
		} catch (SQLException e) {
			logger.error("insertUser : " + e.getMessage());
		}finally {
			close(psmt, conn);
		}
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
			logger.error("selecttUser : " + e.getMessage());
		}finally {
			close(rs, psmt, conn);
		}
		return dto;
	}
	public List<UserDTO> selectUsers() {
		List<UserDTO> list = new ArrayList<>();
		
		return list;
	}
	
	// id로 쿠키 조회
	public UserDTO selectCookie(String uid) {
		UserDTO dto = null;
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.SELECT_COOKIE);
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto = new UserDTO();
				dto = getUser(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs, psmt, conn);
		}
		
		return dto;
	}
	
	public void updateUser(UserDTO dto) {
		
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
			dto.setRegIp(rs.getString(11));
			dto.setRegDate(rs.getDate(12));
			dto.setLeaveDate(rs.getDate(13));
		}catch(Exception e) {}
		return dto;
	}
	
}
