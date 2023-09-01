package controller.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

import dto.ArticleDTO;
import dto.UserDTO;
import service.ArticleService;

@WebServlet("/view.do")
public class ViewController extends HttpServlet {
	private static final long serialVersionUID = 5834848870442465215L;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ArticleService service = ArticleService.getInstanse();
	
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		UserDTO sessUser = (UserDTO) session.getAttribute("sessUser");
		
		String strNo = request.getParameter("no");
		int no = Integer.parseInt(strNo);
		logger.info("no : " + no);
		
		if(sessUser != null) {
			ArticleDTO dto = service.selectArticle(no);
			List<ArticleDTO> contents = service.selectContents(no);
			
			request.setAttribute("article", dto);
			request.setAttribute("contents", contents);
			
			logger.info("service.selectArticle : " + dto);
			logger.info("service.selectContents : " + contents);
			
			RequestDispatcher rd 
				= request.getRequestDispatcher("view.jsp");
			rd.forward(request, response);
		}else {
			response.sendRedirect("/Jboard2/user/login.do");
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		String strParent = request.getParameter("parent");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		String regIp = request.getRemoteAddr();
		int parent = Integer.parseInt(strParent);
		
		logger.debug("content : " + content);
		logger.debug("writer : " + writer);
		logger.debug("parent : " + parent);
		
		ArticleDTO dto = new ArticleDTO();
		dto.setParent(parent);
		dto.setContent(content);
		dto.setWriter(writer);
		dto.setRegIp(regIp);
		
		int result = service.insertContent(dto);
		logger.info("viewPost_dto : " + dto);
		
		// response.sendRedirect("/Jboard2/view.do?no="+parent);
		// ajax 요청은 Json을 return 해줘야됨 
		// -> sendRedirect : form 전송일 때 해주는거임
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		
		response.getWriter().print(json);
	}
	
}
