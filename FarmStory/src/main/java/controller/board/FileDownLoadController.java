package controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.FileDTO;
import service.ArticleService;
import service.FileService;

@WebServlet("/board/fileDownLoad.do")
public class FileDownLoadController extends HttpServlet {
	private static final long serialVersionUID = 5233004322957533062L;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ArticleService service = ArticleService.INSTANCE;
	private FileService fService = FileService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		// 데이터 수신
		String fno = request.getParameter("fno");
		logger.debug("fileDownLoad fno : " + fno);
		
		// 파일 조회 
		FileDTO dto = fService.selectFile(Integer.parseInt(fno));
		logger.debug("fileDownLoad dto : " + dto);
	
		// 파일 다운로드
		service.downloadFile(request, response, dto);
	}
	
}
