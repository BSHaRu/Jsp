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

import dto.ArticleDTO;
import service.ArticleService;

@WebServlet("/modify.do")
public class ModifiyController extends HttpServlet {
	private static final long serialVersionUID = -2019395716734072546L;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ArticleService service = ArticleService.getInstanse();
	
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		String strNo = request.getParameter("no");
		int no = Integer.parseInt(strNo);
		
		ArticleDTO dto = service.selectArticle(no);
		request.setAttribute("article", dto);
		logger.info("modify dto : "+ dto);
		
		RequestDispatcher rd 
			= request.getRequestDispatcher("modify.jsp");
		rd.forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		String strNo = request.getParameter("no");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int no = Integer.parseInt(strNo);
		
		ArticleDTO dto = new ArticleDTO();
		dto.setNo(no);
		dto.setTitle(title);
		dto.setContent(content);
		
		service.updateArticle(dto);
		logger.info("modifyPost_dto : "+ dto);
		
		response.sendRedirect("/Jboard2/view.do?no="+no);
	}
}
