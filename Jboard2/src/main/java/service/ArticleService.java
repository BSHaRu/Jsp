package service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.ArticleDAO;
import dto.ArticleDTO;
import dto.FileDTO;

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
	public List<ArticleDTO> selectArticles(int start, int pageCount, String search){
		return dao.selectArticles(start, pageCount, search);
	}
	
	public int selectCountTotal(String search) {
		return dao.selectCountTotal(search);
	}
	
	public int insertContent(ArticleDTO dto) {
		return dao.insertContent(dto);
	}
	
	// 댓글 조회
	public List<ArticleDTO> selectContents(int parent) {
		return dao.selectContents(parent);
	}
	
	public void updateArticle(ArticleDTO dto) {
		dao.updateArticle(dto);
	}

	public int deleteArticle(int no) {
		return dao.deleteArticle(no);
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
	public void downloadFile(HttpServletRequest request, 
			HttpServletResponse response, FileDTO dto) throws IOException {
		// response 파일 다운로드 헤더 수정
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment; filename="+URLEncoder.encode(dto.getOriName(), "utf-8"));
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "private");
		logger.debug("downloadFile dto : "+dto.getOriName());
		
		// response 파일 stream 작업
		String path = getFilePath(request);
		File file = new File(path+"/"+dto.getNewName());
		
		BufferedInputStream bis 
			= new BufferedInputStream(
					new FileInputStream(file));

		BufferedOutputStream bos 
			= new BufferedOutputStream(
					response.getOutputStream());
		
		while(true){
			int data = bis.read();
			if(data == -1) break;
			bos.write(data);
		}
		bos.flush();

		bos.close();
		bis.close();
	}
	
	// 페이지 마지막 번호
	public int getLastPageNum(int total, int pageCount) {
		
		int lastPageNum = 0;
		
		if(total % pageCount == 0){
			lastPageNum = total / pageCount;
		}else{
			lastPageNum = total / pageCount + 1;
		}
		
		return lastPageNum;
	}
	
	// 페이지 그룹 계산
	public int[] getPageGroupNum(int currentPage, int lastPageNum, int pageCount) {
		int pageGroupCurrent 
			= (int) Math.ceil(currentPage / (double)pageCount);
		int pageGroupStart 
			= (pageGroupCurrent - 1) * pageCount + 1;
		int pageGroupEnd 
			= pageGroupCurrent * pageCount;
		
		// 마지막 페이지 보여줌
		if(pageGroupEnd > lastPageNum){
			pageGroupEnd = lastPageNum;
		}
		
		int[] result = { pageGroupStart, pageGroupEnd };
		
		return result;
	}
	
	// 페이지 시작번호
	public int getPageStartNum(int total, int currentPage, int pageCount) {
		int start = (currentPage - 1) * pageCount;
		return total - start;
	}
	
	// 현재 페이지 번호
	public int getCurrentPage(String pg) {
		int currentPage = 1;
		if(pg != null) currentPage = Integer.parseInt(pg);	
		
		return currentPage;
	}
	
	// Limit 시작번호
	public int getStartNum(int currentPage, int pageCount) {
		return (currentPage - 1) * pageCount;
	}
	
	
}
