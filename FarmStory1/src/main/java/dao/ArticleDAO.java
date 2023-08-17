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
			close();
		}
	}
	
	// PM
	public List<ArticleDTO> selectPM(String cate) {
		List<ArticleDTO> list = new ArrayList<>();
		PageMaker pm = new PageMaker();
		conn = getConnection();
		try {
			psmt = conn.prepareStatement(SQL.SELECT_PM);
			psmt.setString(1, cate);
			psmt.setInt(2, pm.getStartPage());
			psmt.setInt(3, pm.getDisplayPageNum());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ArticleDTO dto = new ArticleDTO();
				dto = getArticleDTO(rs);
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
		}
		return total;
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
			dto.setNick(rs.getString(12));
		}catch(Exception e) {
			System.out.println("getArticleDTO : " + e.getMessage());
		}
		return dto;
	}
	
	
	
	
}
