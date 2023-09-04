package service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dao.ArticleDAO;
import dto.ArticleDTO;

public enum ArticleService {

	INSTANSE;
	
	private ArticleDAO dao = ArticleDAO.getInstance(); 
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insertArticle(ArticleDTO dto) {
		dao.insertArticle(dto);
	}
	
	// 게시글 보기
	public ArticleDTO selectArticle(int no) {
		return dao.selectArticle(no);
	}	
		
	public List<ArticleDTO> selectPM(String cate, int start, int pageCount) {
		return dao.selectPM(cate, start, pageCount);
	}
	public void updateArticle(ArticleDTO dto) {
		
	}
	public void deleteArticle(int no) {
		
	}
}
