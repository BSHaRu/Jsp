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

	public static FileDAO instance = new FileDAO();
	public static FileDAO getInstance() {
		return instance;
	}
	private FileDAO() {}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	public void insertFile(FileDTO dto) {
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.INSERT_FILE);
			psmt.setInt(1, dto.getAno());
			psmt.setString(2, dto.getOriName());
			psmt.setString(3, dto.getNewName());
			psmt.executeUpdate();
			logger.debug("insertFile dto : "+dto);
			
			conn.commit();
		} catch (SQLException e) {
			logger.error("insertFile : "+e.getMessage());
		}finally {
			close(psmt, conn);
		}
	}
	
	// 파일 조회
	public FileDTO selectFile(int fno) {
		FileDTO dto = null;
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.SELECT_FILE);
			psmt.setInt(1, fno);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto = new FileDTO();
				dto = getFile(rs);
			}
		} catch (SQLException e) {
			logger.error("selectFile : "+e.getMessage());
		}finally {
			close(rs, psmt, conn);
		}
		return dto;
	}
	
	// 파일 다운로드
	public List<FileDTO> fileDownload() {
		List<FileDTO> list = new ArrayList<>();
		conn = getConnection();
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SQL.FILE_DOWNLOAD);
			
			while(rs.next()) {
				FileDTO dto = new FileDTO();
				dto = getFile(rs);
				list.add(dto);
			}
		} catch (SQLException e) {
			logger.error("fileDownload : " +e.getMessage());
		}finally {
			close(rs, psmt, conn);
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
			dto.setFno(rs.getInt("fno"));
			dto.setAno(rs.getInt("ano"));
			dto.setOriName(rs.getString("oriName"));
			dto.setNewName(rs.getString("newName"));
			dto.setDownload(rs.getInt("download"));
			dto.setRegDate(rs.getDate("regDate"));
			logger.info("getFile dto : "+dto);
		}catch (Exception e) {
			logger.error("getFile : " + e.getMessage());
		}
		return dto;
	}
}
