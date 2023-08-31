package service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.ArticleDAO;
import dto.ArticleDTO;

public class ArticleService {
	public static ArticleService instanse = new ArticleService();
	public static ArticleService getInstanse() {
		return instanse;
	}
	private ArticleService(){}
	
	private ArticleDAO dao = ArticleDAO.getInstanse(); 
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	public int insertArticle(ArticleDTO dto) {
		return dao.insertArticle(dto);
	}
	
	public ArticleDTO selectArticle(int no) {
		return dao.selectArticle(no);
	}

	// 게시판 전체 조회
	public List<ArticleDTO> selectArticles(int start, int pageCount){
		return dao.selectArticles(start, pageCount);
	}
	
	public void insertContent(ArticleDTO dto) {
		dao.insertContent(dto);
	}
	
	// 댓글 조회
	public List<ArticleDTO> selectContents(int parent) {
		return dao.selectContents(parent);
	}
	
	public void updateArticle(ArticleDTO dto) {
		dao.updateArticle(dto);
	}

	public void deleteArticle(int no) {
		dao.deleteArticle(no);
	}
	
	// 파일 업로드 경로
	public String getFilePath(HttpServletRequest request) {
		// 파일 업로드 경로
		ServletContext ctx = request.getServletContext();
		String filePath = ctx.getRealPath("/upload");
		
		return filePath;
	}
	
	// uuid로 파일명 재 설정
	public String renameToFile(HttpServletRequest request, String oName) {
		// 경로 설정
		String filePath = getFilePath(request);

		int idx = oName.lastIndexOf(".");
		String ext = oName.substring(idx);
		
		String uuid = UUID.randomUUID().toString();
		String sName = uuid + ext; 
		
		File f1 = new File(filePath+"/"+oName);
		File f2 = new File(filePath+"/"+sName);
		// 기존 파일 명을 uuid값으로 이름 변경 후 새로 저장
		f1.renameTo(f2);
		
		return sName;
	}
	
	// 파일 업로드
	public MultipartRequest uploadFile(HttpServletRequest request) {
		// 경로 설정
		String filePath = getFilePath(request);
		
		// 업로드 파일 최대 사이즈
		int maxSize = 1024 * 1024 * 10;
		
		// 파일 업로드 
		// MultipartRequest가 파일 업로드 로직을 알아서 처리해줌
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(
					request, filePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		} catch (IOException e) {
			logger.error("uploadFile : " + e.getMessage());
		}
		return mr;
	}
	
	// 파일 다운로드
	public void downloadFile() {
		
	}
	
	
	// PM
	public void PageMaker() {
		
	}
	
	
}
