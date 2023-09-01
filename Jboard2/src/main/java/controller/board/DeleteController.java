package controller.board;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

import service.ArticleService;
import service.FileSerivce;

@WebServlet("/delete.do")
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = -3208933405264979414L;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ArticleService service = ArticleService.getInstanse();
	private FileSerivce fService = FileSerivce.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		String strNo = request.getParameter("no");
		int no = Integer.parseInt(strNo);
		logger.debug("delete no : " + no);
		
		// 파일 삭제(Directory)
		// -> 파일이 없으면 exception 발생하기 때문에 조건이 필요
		// => 폴더안에 파일명은 uuid니깐 uuid 값으로 조회 후 파일을 삭제
		String path = service.getFilePath(request);
		
		File file = new File(path+"/"+"uuid");
		
		// 파일이 존재하면 삭제
		if(file.exists()) file.delete();
			
		// 파일 삭제(DB)
		// -> 디렉토리 삭제 이후 DB를 삭제해주는게 로직이 깔끔하고 편함
		int result = fService.deleteFile(no);
		
		
		// 글 + 댓글 삭제
		service.deleteArticle(no);
		
		response.sendRedirect("/Jobard2/list.do");
	}
	
	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		String strNo = request.getParameter("no");
		int no = Integer.parseInt(strNo);
		
		int result = service.deleteArticle(no);
		
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		response.getWriter().print(json);
		
	}
	
}
