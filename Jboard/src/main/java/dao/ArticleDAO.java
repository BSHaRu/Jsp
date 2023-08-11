package dao;

import java.sql.SQLException;
import java.util.*;
import util.*;
import vo.*;

public class ArticleDAO extends DBCP {
	
	public void insertArticle(ArticleVO vo) throws SQLException {
		try{
			conn = getConnection();
			
			psmt = conn.prepareStatement(SQL.INSERT_ARTICLE);
			psmt.setString(1, vo.getTitle());
			psmt.setString(2, vo.getContent());
			psmt.setString(3, vo.getWriter());
			psmt.setString(4, vo.getRegIp());
			
			psmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println("insertArticle : " + e.getMessage());
		}finally{
			close();
		}
	}
	
	// 댓글 추가
	public void insetContent(ArticleVO vo) throws SQLException {
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_CONTENT);
			psmt.setInt(1, vo.getParent());
			psmt.setString(2, vo.getContent());
			psmt.setString(3, vo.getWriter());
			psmt.setString(4, vo.getRegIp());
			
			psmt.executeLargeUpdate();
			
		}catch(Exception e) {
			System.out.println("insetContent : " + e.getMessage());
		}finally{
			close();
		}
	}
	
	// 
	public ArticleVO selectArticle(int no) throws SQLException {
		ArticleVO vo = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_ARTICEL);
			psmt.setInt(1, no);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				vo = new ArticleVO();
				vo.setNo(rs.getInt(1));
				vo.setParent(rs.getInt(2));
				vo.setComment(rs.getInt(3));
				vo.setCate(rs.getString(4));
				vo.setTitle(rs.getString(5));
				vo.setContent(rs.getString(6));
				vo.setFile(rs.getInt(7));
				vo.setHit(rs.getInt(8));
				vo.setWriter(rs.getString(9));
				vo.setRegIp(rs.getString(10));
				vo.setRegDate(rs.getDate(11));
			}
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}finally {
			close();
		}
		
		return vo;
	}
	
	// 게시판 닉네임으로 표시 & PM
	public List<ArticleVO> selectArticles(int start, int pageCount) throws SQLException {
		List<ArticleVO> list = new ArrayList<>();
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_ARTICLES);
			psmt.setInt(1, start);
			psmt.setInt(2, pageCount);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ArticleVO vo = new ArticleVO();
				vo.setNo(rs.getInt(1));
				vo.setParent(rs.getInt(2));
				vo.setComment(rs.getInt(3));
				vo.setCate(rs.getString(4));
				vo.setTitle(rs.getString(5));
				vo.setContent(rs.getString(6));
				vo.setFile(rs.getInt(7));
				vo.setHit(rs.getInt(8));
				vo.setWriter(rs.getString(9));
				vo.setRegIp(rs.getString(10));
				vo.setRegDate(rs.getDate(11));
				// join
				vo.setNick(rs.getString(12));
				
				list.add(vo);
			}
		}catch(Exception e) {
			System.out.println("selectArticle : " + e.getMessage());
		}finally {
			close();
		}
		return list;
	}
	
	// 게시글 전체 조회
	public int selectCountTotal() throws SQLException {
		int total = 0;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_COUNT_ARTICLE);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				total = rs.getInt(1);
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			close();
		}
		
		return total;
	}
	
	// 댓글 목록 확인
	public List<ArticleVO> selectComments(int parent) throws SQLException {
		List<ArticleVO> list = new ArrayList<>();
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_COMMENTS);
			psmt.setInt(1, parent);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ArticleVO vo = new ArticleVO();
				vo.setNo(rs.getInt(1));
				vo.setParent(rs.getInt(2));
				vo.setComment(rs.getInt(3));
				vo.setCate(rs.getString(4));
				vo.setTitle(rs.getString(5));
				vo.setContent(rs.getString(6));
				vo.setFile(rs.getInt(7));
				vo.setHit(rs.getInt(8));
				vo.setWriter(rs.getString(9));
				vo.setRegIp(rs.getString(10));
				vo.setRegDate(rs.getDate(11));
				vo.setNick(rs.getString(12));
				
				list.add(vo);
			}
			
		}catch (Exception e) {
			System.out.println("selecteCommnets" + e.getMessage());
		}finally{
			close();
		}
		return list;
	}
	
	// 게시글 수정 업데이트
	public void updateArticle(ArticleVO vo) throws SQLException {
		
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.UPDATE_ARTICLE);
			psmt.setString(1, vo.getTitle());
			psmt.setString(2, vo.getContent());
			//psmt.setInt(3, vo.getFile());
			psmt.setInt(3, vo.getNo());
			
			psmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			close();
		}
	}
	
	// 댓글 개수 표시 +
	public void updateCommentCountPlus(int no) throws SQLException {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.UPDATE_COMMENT_COUNT_PLUS);
			psmt.setInt(1, no);
			psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("update : " + e.getStackTrace());
		}finally{
			close();
		}
	}
	
	// 댓글 개수 표시 -
	public void updateCommentCountMin(int no) throws SQLException {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.UPDATE_COMMENT_COUNT_MIN);
			psmt.setInt(1, no);
			psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("update : " + e.getStackTrace());
		}finally{
			close();
		}
	}
	
	// 댓글 수정
	public void updateComment(String content, int no) throws SQLException {
		conn = getConnection();
		try {
			psmt = conn.prepareCall(SQL.UPDATE_COMMENT);
			psmt.setString(1, content);
			psmt.setInt(2, no);
			psmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("updateComment : " + e.getMessage());
		}finally {
			close();
		}
	}
	
	// 댓글 삭제
	public void deleteContent(int no) throws SQLException {
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.DELETE_CONTENT);
			psmt.setInt(1, no);
			psmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("deleteContent : " + e.getMessage());
		}finally {
			close();
		}
	}
	
	// 게시글 삭제
	public void deleteArticle(int no) throws SQLException {
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.DELETE_ARTICLE);
			psmt.setInt(1, no);
			// 댓글이 있으면 댓글 번호(parent)는
			// 결국 게시글 no를 따라가니깐 2번째 쿼리도 no가 됨
			psmt.setInt(2, no);
			psmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("deleteArticle : " + e.getMessage());
		}finally {
			close();
		}
	}
}
