package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.FileDTO;
import util.DBCP;
import util.SQL;

public class FileDAO extends DBCP{

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insertFile(FileDTO dto) {
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.INSERT_FILE);
			psmt.setInt(1, dto.getAno());
			psmt.setString(2, dto.getOriName());
			psmt.setString(3, dto.getNewName());
			psmt.executeUpdate();
			logger.info("insertFile dto : "+dto);
		} catch (SQLException e) {
			logger.error("insertFile : " + e.getMessage());
		}finally {
			close(psmt, conn);
		}
	}
	
	public FileDTO selectFile(int fno) {
		FileDTO dto = null;
		
		return dto;
	}
	
	public List<FileDTO> selectFiles() {
		List<FileDTO> list = new ArrayList<>();
		conn = getConnection();
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SQL.SEECT_FILES);
			
			while(rs.next()) {
				FileDTO dto = new FileDTO();
				dto = getFile(rs);
				list.add(dto);
			}
			logger.info("selectFiles : " + list);
		} catch (SQLException e) {
			logger.error("selectFiles : " + e.getMessage());
		}finally {
			close(rs, stmt, conn);
		}
		return list;
	}
	
	public void updateFile(FileDTO dto) {
		
	}
	
	public void deleteFile(int fno) {
		
	}
	
	public FileDTO getFile(ResultSet rs) {
		FileDTO dto = null;
		try {
			dto = new FileDTO();
			dto.setAno(rs.getInt(1));
			dto.setOriName(rs.getString(2));
			dto.setNewName(rs.getString(3));
			dto.setDownload(rs.getInt(4));
			dto.setRegDate(rs.getDate(5));
		}catch (Exception e) {}
		return dto;
	}
}
