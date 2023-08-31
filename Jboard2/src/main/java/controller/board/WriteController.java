package controller.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oreilly.servlet.MultipartRequest;

import dto.ArticleDTO;
import dto.FileDTO;
import service.ArticleService;
import service.FileSerivce;

@WebServlet("/write.do")
public class WriteController extends HttpServlet{
	private static final long serialVersionUID = -1107743843833762334L;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ArticleService service = ArticleService.getInstanse();
	private FileSerivce fService = FileSerivce.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd 
			= request.getRequestDispatcher("write.jsp");
		rd.forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		// 파일 업로드
		MultipartRequest mr = service.uploadFile(request);
		
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
		String writer = mr.getParameter("writer");

		// 파일의 원래 이름
		String oName = mr.getOriginalFileName("file");

		String regIp = request.getRemoteAddr();

		ArticleDTO dto = new ArticleDTO();
		dto.setTitle(title);
		dto.setContent(content);
		dto.setFile(oName == null ? 0 : 1);
		dto.setWriter(writer);
		dto.setRegIp(regIp);
		
		request.setAttribute("article", dto);
		
		// 게시판 글 쓴 후 해당 게시판 번호를 가져옴
		int ano = service.insertArticle(dto);
		
		// 파일명 수정 
		if(oName != null) {
			String sName = service.renameToFile(request, oName);
			
			// 파일 테이블 Insert
			FileDTO fileDto = new FileDTO();
			fileDto.setAno(ano);
			fileDto.setOriName(oName);
			fileDto.setNewName(sName);
			
			fService.insertFile(fileDto);
			logger.info("WritePost_fileDto : " + fileDto);
		}
		
		logger.info("WritePost_dto : " + dto);
		response.sendRedirect("/Jboard2/list.do");
	}
}
