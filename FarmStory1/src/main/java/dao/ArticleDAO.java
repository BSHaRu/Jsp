package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.ArticleDTO;
import util.*;

public class ArticleDAO extends DBCP {

	// 게시판 글 쓰기
	public void insertArticle(ArticleDTO dto) {
		try{
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_ARTICLE);
			psmt.setString(1, dto.getCate());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getWriter());
			psmt.setString(5, dto.getRegIp());
			
			psmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println("insertArticle : " + e.getMessage());
		}finally{
			close(psmt, conn);
		}
	}
	
	// PM - 현재 페이지 게시물 조회
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
				dto = getArticleDTO(rs);
				dto.setNick(rs.getString(12));
				list.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("selectPM : " + e.getMessage());
		}finally {
			close(rs, psmt, conn);
		}
		return list;
	}
	
	// 전체 게시글 조회
	public int selectCountTotal(String cate) {
		int total = 0;
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.SELECT_COUNT_TOTAL);
			psmt.setString(1, cate);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				total = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("selectCountTotal : " + e.getMessage());
		} finally {
			close(rs, psmt, conn);
		}
		return total;
	}
	
	// 현재 게시글 보기
	public ArticleDTO selectArticle(int no) {
		ArticleDTO dto = null;
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.SELECT_ARTICLE);
			psmt.setInt(1, no);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto = new ArticleDTO();
				dto = getArticleDTO(rs);
			}
		} catch (SQLException e) {
			System.out.println("selectArticle : " + e.getMessage());
		} finally {
			close(rs, psmt, conn);
		}
		
		return dto;
	}
	
	// 댓글 쓰기
	public void insertContent(ArticleDTO dto) {
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.INSERT_CONTENT);
			psmt.setString(1, dto.getCate());
			psmt.setInt(2, dto.getParent());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getWriter());
			psmt.setString(5, dto.getRegIp());
			psmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insertContent : " + e.getMessage());
		}finally {
			close(psmt, conn);
		}
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
				dto = getArticleDTO(rs);
				dto.setNick(rs.getString(12));
				list.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("selectContents : " + e.getMessage());
		} finally {
			close(rs, psmt, conn);
		}
		return list;
	}
	
	// 댓글 표시++
	public void updateCommentCount() {
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.UPDATE_COMMENT_COUNT);
		} catch (SQLException e) {
			System.out.println("updateCommentCount : " + e.getMessage());
		} finally {
			close(psmt, conn);
		}
	}
	
	// 댓글 수정 ++
	public void updateContent(String content, int no) {
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.UPDATE_CONTENT);
			psmt.setString(1, content);
			psmt.setInt(2, no);
			psmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("updateContent : " + e.getMessage());
		}finally {
			close(psmt, conn);
		}
	}
	
	// 게시판 글 수정
	public void updateArticle(ArticleDTO dto) {
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.UPDATE_Article);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setInt(3, dto.getNo());
			psmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("updateArticle : " + e.getMessage());
		} finally {
			close(psmt, conn);
		}
	}
	
	// 게시판 삭제 ++
	public void deleteArticle() {
		
	}
	
	// dto rs
	public ArticleDTO getArticleDTO(ResultSet rs) {
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
		}catch(Exception e) {
			System.out.println("getArticleDTO : " + e.getMessage());
		}
		return dto;
	}
	
	
	
	
}
