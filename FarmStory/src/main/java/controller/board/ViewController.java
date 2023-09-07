package controller.board;

import java.io.IOException;
import java.util.List;

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

@WebServlet("/board/view.do")
public class ViewController extends HttpServlet {
	private static final long serialVersionUID = 4233004322957533062L;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ArticleService service = ArticleService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		String group = request.getParameter("group");
		String cate = request.getParameter("cate");
		String no = request.getParameter("no");
		
		ArticleDTO dto 
			= service.selectArticle(Integer.parseInt(no));
		logger.debug("view dto : "+dto);
		
		List<ArticleDTO> contents 
			= service.selectContents(Integer.parseInt(no));
		logger.debug("view contents : "+contents);
		
		request.setAttribute("group", group);
		request.setAttribute("cate", cate);
		
		request.setAttribute("article", dto);
		request.setAttribute("contents", contents);
		
		
		RequestDispatcher rd 
			= request.getRequestDispatcher("/board/view.jsp");
		rd.forward(request, response);
	}
	
}
