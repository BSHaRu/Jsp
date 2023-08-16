package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import dto.*;
import util.*;

public class UserDAO extends DBCP {

	public static UserDAO instansce = new UserDAO();
	
	public static UserDAO getInstansce() {
		return instansce;
	}
	private UserDAO() {}
	
	
	// 약관 
	public TermsDTO selectTerms() {
		TermsDTO dto = new TermsDTO();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SQL.SELECT_TERMS);
			if(rs.next()) {
				dto.setTerms(rs.getString(1));
				dto.setPrivacy(rs.getString(2));
			}
		} catch (SQLException e) {
			System.out.println("select terms : " + e.getMessage());
		}finally {
			close(rs, stmt, conn);
		}
		return dto;		
	}
	
	// 회원 가입
	public void insertUser(UserDTO dto) {
		try {
			conn = getConnection();
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
			System.out.println("insertUser : " + e.getMessage());
		}finally {
			close(psmt, conn);
		}
	}
	
	// 로그인 
	public UserDTO selectUser(String uid, String pass) {
		UserDTO dto = null;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_USER);
			psmt.setString(1, uid);
			psmt.setString(2, pass);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto = getUser(rs);
			}
		} catch (SQLException e) {
			System.out.println("selectUser : " + e.getMessage());
		}finally{
			close(rs, psmt, conn);
		}
		return dto;
	}
	
	
	
	
	
	// userDTO rs
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
		}catch (Exception e) {
			System.out.println("UserDTO : " + e.getMessage());
		}
		return dto;
	}
}
