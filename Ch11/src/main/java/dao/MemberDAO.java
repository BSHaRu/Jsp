package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.MemberDTO;
import util.DBCP;

public class MemberDAO extends DBCP {
	
	public static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {
		return instance;
	}
	private MemberDAO() {}
	
	// logback 생성
	private Logger logger 
		= LoggerFactory.getLogger(this.getClass());
	
	String sql = "";
	public void insertMember(MemberDTO dto) {
		logger.info("insertMember 1");
		
		conn = getConnection();
		try {
			sql = "INSERT INTO member VALUES(?, ?, ?, ?, ?, NOW()) ";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getUid());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getHp());
			psmt.setString(4, dto.getPos());
			psmt.setInt(5, dto.getDep());
			psmt.executeUpdate();
			logger.info("insertMember 2");
		} catch (SQLException e) {
			e.printStackTrace();
			logger.error("insertMember 1 : " + e.getMessage());
		} finally {
			close(psmt, conn);
		}
	} 

	public MemberDTO selectMember(String uid) {
		MemberDTO dto = null;
		
		
		return dto;
	} 
	
	public List<MemberDTO> selectMembers() {
		List<MemberDTO> list = new ArrayList<>();
 		
		return list;
	} 
	
	
	public int updateMember(MemberDTO dto) {
		int total = 0;
		
		return total;
	} 
	
	public void deleteMember() {
		
	} 
}
