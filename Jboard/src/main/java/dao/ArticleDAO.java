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
	
	
	public List<ArticleVO> selectArticles() throws SQLException {
		List<ArticleVO> list = new ArrayList<>();
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_ARTICLES);
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
				
				list.add(vo);
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			close();
		}
		return list;
	}
	public void updateArticle(ArticleVO vo) {
		
	}
	public void deleteArticle(int no) {
		
	}
}
