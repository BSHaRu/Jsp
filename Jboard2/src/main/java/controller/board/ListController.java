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

import dto.ArticleDTO;
import dto.UserDTO;
import service.ArticleService;

@WebServlet("/list.do")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = -5208933405264979414L;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ArticleService service = ArticleService.getInstanse();

	
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		UserDTO sessUser = (UserDTO) session.getAttribute("sessUser");

		int start = 1;
		int pageCount = 5;
		if(sessUser != null) {
			
			List<ArticleDTO> list = service.selectArticles(start, pageCount);
			logger.info("ListController list : " + list);
			request.setAttribute("article", list);
			
			RequestDispatcher rd 
				= request.getRequestDispatcher("list.jsp");
			rd.forward(request, response);
		}else {
			response.sendRedirect("/Jboard2/user/login.do");
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
	}
	
}
