package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.ArticleDTO;
import util.DBCP;
import util.SQL;

public class ArticleDAO extends DBCP{

	public static ArticleDAO instance = new ArticleDAO();
	public static ArticleDAO getInstance() {
		return instance;
	}
	private ArticleDAO() {}
	
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	int result = 0;
	
	public void insertArticle(ArticleDTO dto) {
		
	}
	
	// 현재 게시글 보기
	public ArticleDTO selectArticle(int no) {
		ArticleDTO dto = null;
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.SELECT_ARTICLE);
			psmt.setInt(1, no);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				dto = new ArticleDTO();
				dto = getArticle(rs);
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
		
	}
	public void deleteArticle(int no) {
		
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
