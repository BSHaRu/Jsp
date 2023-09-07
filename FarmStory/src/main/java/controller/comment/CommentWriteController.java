package controller.comment;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;

import dto.ArticleDTO;
import service.ArticleService;

@WebServlet("/comment/write.do")
public class CommentWriteController extends HttpServlet {
	private static final long serialVersionUID = 2230115407217334828L;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ArticleService service = ArticleService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		logger.info("CommentWriteController doGet start ---------------");
		
		RequestDispatcher rd 
			= request.getRequestDispatcher("/board/view.jsp");
		rd.forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		logger.info("CommentWriteController doPost start ---------------");
		
		String parent = request.getParameter("parent");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		String regIp = request.getRemoteAddr();
		
		ArticleDTO dto = new ArticleDTO();
		dto.setParent(Integer.parseInt(parent));
		dto.setWriter(writer);
		dto.setContent(content);
		dto.setRegIp(regIp);
		
		ArticleDTO contents = service.insertContent(dto);
		logger.debug("CommentWrite_Post contents : " + contents);
		
		// Json 출력
		// 여기서 인코딩 해줘야 클라이언트로 전송되는 JSON 한글 안깨짐
		response.setContentType("application/json;charset=UTF-8"); 
		Gson gson = new Gson();
		String strJson = gson.toJson(contents);
		response.getWriter().print(strJson);
	}
}
