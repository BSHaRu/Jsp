package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.ArticleDTO;
import dto.FileDTO;
import util.DBCP;
import util.SQL;

public class ArticleDAO extends DBCP{

	private static ArticleDAO instance = new ArticleDAO();
	public static ArticleDAO getInstance() {
		return instance;
	}
	private ArticleDAO() {}
	
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	int result = 0;
	
	// 게시판 글 쓰고 나서 글 번호를 리턴을 함
	// -> 이걸로 파일 업로드 시 해당 글 번호를 가져올 수 있는거임
	// ※ 글을 쓴 이후, 조회를 해야되는거지 조회 후 글 쓰면 안됨
	public int insertArticle(ArticleDTO dto) {
		int no = 0;
		conn = getConnection();
		try {
			// Transaction을 위해서 autoCommit 해제
			conn.setAutoCommit(false);
			
			stmt = conn.createStatement();
			psmt = conn.prepareStatement(SQL.INSERT_ARTICLE);
			psmt.setString(1, dto.getCate());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setInt(4, dto.getFile());
			psmt.setString(5, dto.getWriter());
			psmt.setString(6, dto.getRegIp());
			psmt.executeUpdate();
			
			// 이걸 하는 이유가 게시판 글 쓰자마자 바로 업로드 되는 게시글 조회하려고
			// -> 파일 업로드 할 때 글 쓰자마자 해당 게시글 번호를 가져 올 수 있음
			rs = stmt.executeQuery(SQL.SELECT_MAX_NO);
			
			// 여기서 commit을 함으로써 
			// 두 쿼리가 모두 성공해야 commit
			// 아니면 rollback()을 처리해서 저장 안되게 해줌
			// -> 근데 왜 fileInsert에서 commit()을 한번 더 해줘야되냐고..
			conn.commit();
			if(rs.next()) no = rs.getInt(1);
			
		} catch (SQLException e) {
			try {
				// 작업 실패시 rollback()을 해서 저장x
				conn.rollback(); 
				logger.error("insertArticle rollback()");
			} catch (SQLException e1) {}
			logger.error("insertArticle : " + e.getMessage());
		}finally {
			close(rs, psmt, conn);
		}
		return no;
	}
	
	// 게시판 조회 -> + 파일 명이 나와야 하기 떄문에 파일과 JOIN
	public ArticleDTO selectArticle(int no) {
		ArticleDTO dto = null;
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.SELECT_ARTICLE);
			psmt.setInt(1, no);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto = new ArticleDTO();
				dto = getArticle(rs);
				
				// 파일 정보
				FileDAO file = FileDAO.getInstance();
				FileDTO fileDto = file.getFile(rs);
				dto.setFileDto(fileDto);
			}
			logger.info("selectArticle dto : " +dto);
		} catch (SQLException e) {
			logger.error("selectArticle : " + e.getMessage());
		}finally{
			close(rs, psmt, conn);
		}
		
		return dto;
	}
	
	// 현재 페이지 게시글 조회 + PM
	public List<ArticleDTO> selectPM(String cate, int start, int pageCount) {
		List<ArticleDTO> list = new ArrayList<>();
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.SELECT_PM);
			psmt.setString(1, cate);
			psmt.setInt(2, start);
			psmt.setInt(3, pageCount);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ArticleDTO dto = new ArticleDTO();
				dto = getArticle(rs);
				dto.setNick(rs.getString("nick"));
				list.add(dto);
			}
		} catch (SQLException e) {
			logger.error("selectPM : " + e.getMessage());
		}finally{
			close(rs, psmt, conn);
		}
		
		return list;
	}
	
	public void updateArticle(ArticleDTO dto) {
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.UPDATE_Article);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setInt(3, dto.getNo());
			psmt.executeUpdate();
		} catch (SQLException e) {
			logger.error("updateArticle : " + e.getMessage());
		}finally {
			close(psmt, conn);
		}
	}
	public void deleteArticle(int no) {
		
	}
	
	// 게시글 조회
	public int selectCountTotal(String cate) {
		int total = 0;
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.SELECT_COUNT_TOTAL);
			psmt.setString(1, cate);
			rs = psmt.executeQuery();
			
			if(rs.next()) total = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs, psmt, conn);
		}
		return total;
	}
	
	// 댓글 목록
	public List<ArticleDTO> selectContents(int no){
		List<ArticleDTO> list = new ArrayList<>();
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.SELECT_CONTENTS);
			psmt.setInt(1, no);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ArticleDTO dto = new ArticleDTO();
				dto = getArticle(rs);
				dto.setNick(rs.getString("nikc"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, psmt, conn);
		}
		return list;
	}

	// 댓글 쓰기 -> 쓰자마자 바로 조회해서 해당 댓글 볼 수 있는 로직
	// => 내나 그 파일업로드랑 비슷한 구조
	public ArticleDTO insertContent(ArticleDTO dto) {
		conn = getConnection();
		try {
			conn.setAutoCommit(false);
			stmt = conn.createStatement();
			
			psmt = conn.prepareStatement(SQL.INSERT_CONTENT);
			psmt.setInt(1, dto.getParent());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getWriter());
			psmt.setString(4, dto.getRegIp());
			psmt.executeUpdate();
			
			conn.commit();
			rs = stmt.executeQuery(SQL.SELECT_CONTENT_LATEST);
			if(rs.next()) {
				dto = new ArticleDTO();
				dto = getArticle(rs);
				dto.setNick(rs.getString("nick"));
			}
			logger.debug("insertContent dto :  "+dto);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, psmt, conn);
		}
		return dto;
	}

	
	
	public ArticleDTO getArticle(ResultSet rs) {
		ArticleDTO dto = null;
		try {
			dto = new ArticleDTO();
			dto.setNo(rs.getInt(1));
			dto.setParent(rs.getInt(2));
			dto.setComment(rs.getInt(3));
			dto.setCate(rs.getString(4));
			dto.setTitle(rs.getString(5));
			dto.setContent(rs.getString(6));
			dto.setFile(rs.getInt(7));
			dto.setHit(rs.getInt(8));
			dto.setWriter(rs.getString(9));
			dto.setRegIp(rs.getString(10));
			dto.setRegDate(rs.getDate(11));
		}catch(Exception e) {}
		
		return dto;
	}
	
}
