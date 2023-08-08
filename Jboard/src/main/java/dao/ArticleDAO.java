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
			System.out.println(e.getMessage());
		}finally{
			close();
		}
	}
	
	public ArticleVO selectArticle(int no) {
		ArticleVO vo = null;
		
		return vo;
	}
	
	
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
			System.out.println(e.getMessage());
		}finally {
			close();
		}
		return list;
	}
	
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
	
	public void updateArticle(ArticleVO vo) {
		
	}
	public void deleteArticle(int no) {
		
	}
}
