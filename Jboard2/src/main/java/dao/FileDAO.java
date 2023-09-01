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
			
			// 왠지 모르겠는데 여기서 commit을 안 해주면
			// 해당 파일이 바로 file table에 저장이 안되고,
			// 이전에 올린 file이 table에 저장이 된다.. 왜??
			// articleDAO에서 autoCommit을 해제해주고
			// 그러고 거기서도 commit을 해줬는데
			// 왜 여기서도 autoCommit이 풀린 상태로 넘어와
			// 수동 commit을 해줘야되는가..?
			conn.commit();
		} catch (SQLException e) {
			logger.error("insertFile : " + e.getMessage());
		}finally {
			close(psmt, conn);
		}
	}
	
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
			logger.error("selectFile : " + e.getMessage());
		}finally {
			close(rs, stmt, conn);
		}
		
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
	
	// 파일은 있을 수도 있고 없을 수도 있음
	// -> 파일이 없을 때 지우면 exception 발생
	// -> 파일을 삭제할 때 게시판이 아니라 디렉토리도 삭제 해줘야됨
	// => uuid로 저장된 파일명을 return 해줌
	public int deleteFile(int ano) {
		int result = 0;
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.DELETE_FILE);
			psmt.setInt(1, ano);
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			logger.error("deleteFile : " + e.getMessage());
		}finally {
			close(stmt, conn);
		}
		return result;
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
