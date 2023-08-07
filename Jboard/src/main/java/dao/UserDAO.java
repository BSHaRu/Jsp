package dao;

import java.sql.*;

import util.*;
import vo.*;

public class UserDAO extends DBCP{
	
	private static UserDAO instance = new UserDAO();
	
	public static UserDAO getInstance() {
		return instance;
	}
	private UserDAO() {}
	
	
	
	public void insertUser(UserVO vo) throws SQLException {
		
		try{
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_USER);
			
			psmt.setString(1, vo.getUid());
			psmt.setString(2, vo.getPass());
			psmt.setString(3, vo.getName());
			psmt.setString(4, vo.getNick());
			psmt.setString(5, vo.getEmail());
			psmt.setString(6, vo.getHp());
			psmt.setString(7, vo.getZip());
			psmt.setString(8, vo.getAddr1());
			psmt.setString(9, vo.getAddr2());
			psmt.setString(10, vo.getRegIp());
			
			psmt.executeUpdate();

		}catch(Exception e){
			System.out.println(e.getMessage());
		}finally {
			close();
		}
	}
	
	public UserVO selectUser(String uid, String pass) throws SQLException {
		UserVO vo = null;
		try{
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_USER);
			psmt.setString(1, uid);
			// SHA2 방식으로 암호화를 만들어서 저장했기 때문에
			// 조회 할 때도 암호화된 상태로 조회해야 됨
			psmt.setString(2, pass);
			
//			System.out.println("uid : " + uid);
//			System.out.println("pass : " + pass);
			rs = psmt.executeQuery();
			if(rs.next()){
				vo = new UserVO();
				vo.setUid(rs.getString(1));
				vo.setPass(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setNick(rs.getString(4));
				vo.setEmail(rs.getString(5));
				vo.setHp(rs.getString(6));
				vo.setRole(rs.getString(7));
				vo.setZip(rs.getString(8));
				vo.setAddr1(rs.getString(9));
				vo.setAddr2(rs.getString(10));
				vo.setRegIp(rs.getString(11));
				vo.setRegDate(rs.getDate(12));
				vo.setLeaveDate(rs.getDate(13));
			}
		}catch(Exception e){
			System.out.println(e.getMessage());
		}finally{
			close();
		}
		
		return vo;
	}
	
	public int selectCountUid(String uid) throws SQLException {
		int result = 0;
		try{
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.CHECK_UID);
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			// 중복이면 1, 없으면 0
			if(rs.next()) result = rs.getInt(1);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}finally{
			close();
		}
		return result;
		
	}
	public int selectCountNick(String nick) throws SQLException {
		int result = 0;
		try{
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.CHECK_NICK);
			psmt.setString(1, nick);
			rs = psmt.executeQuery();
			
			if(rs.next()) result = rs.getInt(1);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}finally{
			close();
		}
		
		return result;
		
	}
	public int selectCountHp(String hp) throws SQLException {
		int result = 0;
		try{
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.CHECK_HP);
			psmt.setString(1, hp);
			rs = psmt.executeQuery();
			
			if(rs.next()) result = rs.getInt(1);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}finally{
			close();
		}
		return result;
	}
	public int selectCountEmail(String email) throws SQLException {
		int result = 0;
		try{
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.CHECK_EMAIL);
			psmt.setString(1, email);
			rs = psmt.executeQuery();
			
			if(rs.next()) result = rs.getInt(1);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}finally{
			close();
		}
		return result;
	}
	
	public TermsVO selectTerms() throws SQLException {
		TermsVO vo = new TermsVO();
		try{
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SQL.SELECT_TERMS);
			
			if(rs.next()) {
				vo.setTerms(rs.getString(1));
				vo.setPrivacy(rs.getString(2));
			}
		}catch(Exception e){
			System.out.println(e.getMessage());
		}finally{
			close();
		}
		return vo;
	}
	
	
	public void selsetUsers() {
		
	}
	
	public void updateUser() {
		
	}
	
	public void deleteUser() {
		
	}
}
