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
import service.FileService;

@WebServlet("/board/write.do")
public class WriteController extends HttpServlet {
	private static final long serialVersionUID = 2233004322957533062L;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ArticleService service = ArticleService.INSTANCE;
	private FileService fService = FileService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		String group = request.getParameter("group");
		String cate = request.getParameter("cate");
		
		request.setAttribute("group", group);
		request.setAttribute("cate", cate);
		
		RequestDispatcher rd 
			= request.getRequestDispatcher("/board/write.jsp");
		rd.forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		// 파일 업로드
		MultipartRequest mr = service.uploadFile(request);
		
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
		String group = mr.getParameter("group");
		String cate = mr.getParameter("cate");
		String writer = mr.getParameter("writer");

		// 파일의 원래 이름
		String oName = mr.getOriginalFileName("file");

		String regIp = request.getRemoteAddr();

		ArticleDTO dto = new ArticleDTO();
		dto.setCate(cate);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setFile(oName == null ? 0 : 1);
		dto.setWriter(writer);
		dto.setRegIp(regIp);
		
		int ano = service.insertArticle(dto);
		logger.debug("write_post ano : " + ano);
		
		// 파일명 수정 
		if(oName != null) {
			String sName = service.renameToFile(request, oName);
			
			// 파일 테이블 Insert
			FileDTO fileDto = new FileDTO();
			fileDto.setAno(ano);
			fileDto.setOriName(oName);
			fileDto.setNewName(sName);
			
			fService.insertFile(fileDto);
			logger.info("writepost_fileDto : " + fileDto);
		}
		
		logger.debug("write_post dto : " + dto);
		response.sendRedirect("/FarmStory/board/list.do?group="+group+"&cate="+cate);
	}
}
