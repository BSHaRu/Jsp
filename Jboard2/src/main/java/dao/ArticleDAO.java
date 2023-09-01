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

public class ArticleDAO extends DBCP {
	public static ArticleDAO instanse = new ArticleDAO();
	public static ArticleDAO getInstanse() {
		return instanse;
	}
	private ArticleDAO(){}
	
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
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setInt(3, dto.getFile());
			psmt.setString(4, dto.getWriter());
			psmt.setString(5, dto.getRegIp());
			psmt.executeUpdate();
			rs = stmt.executeQuery(SQL.SELECT_MAX_NO);
			
			// 여기서 commit을 함으로써 
			// 두 쿼리가 모두 성공해야 commit
			// 아니면 rollback()을 처리해서 저장 안되게 해줌
			conn.commit();

			if(rs.next()) no = rs.getInt(1);
			
			logger.info("insertArticle no : " + no);
		} catch (SQLException e) {
			try {
				// 작업 실패시 rollback()을 해서 저장x
				conn.rollback(); 
				logger.error("insertArticle rollback()");
			} catch (SQLException e1) {}
			logger.error("insertArticle : "+e.getMessage());
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
			psmt = conn.prepareStatement(SQL.SELECT_ARTICEL);
			psmt.setInt(1, no);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto = new ArticleDTO();
				dto = getArticle(rs);
				
				// 파일 정보
				FileDAO file = new FileDAO();
				FileDTO fileDto = file.getFile(rs);
				dto.setFileDto(fileDto);
			}
		} catch (SQLException e) {
			logger.error("selectArticle : " + e.getMessage());
		} finally {
			close(rs, psmt, conn);
		}
		return dto;
	}
	
	// article 전체 조회
	public List<ArticleDTO> selectArticles(int start, int pageCount, String search){
		List<ArticleDTO> list = new ArrayList<>();
		conn = getConnection();
		try {
			if(search != null && !search.equals("")) {
				psmt = conn.prepareStatement(SQL.SELECT_ARTICLES_FOR_SEARCH);
				psmt.setString(1, "%"+search+"%");
				psmt.setInt(2, start);
				psmt.setInt(3, pageCount);
			}else {
				psmt = conn.prepareStatement(SQL.SELECT_ARTICLES);
				psmt.setInt(1, start);
				psmt.setInt(2, pageCount);
			}
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ArticleDTO dto = new ArticleDTO();
				dto = getArticle(rs);
				dto.setNick(rs.getString("nick"));
				list.add(dto);
			}
		} catch (SQLException e) {
			logger.error("selectArticles : " + e.getMessage());
		} finally {
			close(rs, psmt, conn);
		}
		return list;
	}
	
	// 게시글 조회
	public int selectCountTotal(String search) {
		int total = 0;
		conn = getConnection();
		try {
			if(search != null && !search.equals("")) {
				psmt = conn.prepareStatement(SQL.SELECT_COUNT_ARTICLE_FOR_SEARCH);
				psmt.setString(1, "%"+search+"%");
			}else {
				psmt = conn.prepareStatement(SQL.SELECT_COUNT_ARTICLE);
			}
			rs = psmt.executeQuery();
			if(rs.next()) total = rs.getInt(1);
		} catch (SQLException e) {
			logger.error("selectCountTotal : " + e.getMessage());
		} finally {
			close(rs, psmt, conn);
		}
		return total;
	}
	
	// 댓글 쓰기
	public int insertContent(ArticleDTO dto) {
		int result = 0;
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.INSERT_CONTENT);
			psmt.setInt(1, dto.getParent());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getWriter());
			psmt.setString(4, dto.getRegIp());
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			logger.error("insertContent : " + e.getMessage());
		}finally {
			close(psmt, conn);
		}
		return result;
	}
	
	// 댓글 보기
	public List<ArticleDTO> selectContents(int parent) {
		List<ArticleDTO> list = new ArrayList<>();
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.SELECT_CONTENTS);
			psmt.setInt(1, parent);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ArticleDTO dto = new ArticleDTO();
				dto = getArticle(rs);
				dto.setNick(rs.getString("nick"));
				list.add(dto);
			}
			logger.info("selectContents : " + list);
		} catch (SQLException e) {
			logger.error("selectContents : " + e.getMessage());
		} finally {
			close(rs, psmt, conn);
		}
		return list;
	}
	
	public void updateArticle(ArticleDTO dto) {
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.UPDATE_ARTICLE);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setInt(3, dto.getNo());
			psmt.executeUpdate();
		} catch (SQLException e) {
			logger.error("updateArticle : " + e.getMessage());
		} finally {
			close(psmt, conn);
		}
	}

	public int deleteArticle(int no) {
		int result = 0;
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.DELETE_ARTICLE);
			psmt.setInt(1, no);
			// no랑 parent는 결국 같은 값이기 떄문에 no로 2개 받음
			psmt.setInt(2, no);
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			logger.error("deleteArticle : " + e.getMessage());
		} finally {
			close(psmt, conn);
		}
		return result;
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
		}catch (Exception e) {}
			
		return dto;
	}
}
