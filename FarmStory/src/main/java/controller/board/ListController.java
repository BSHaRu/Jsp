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

@WebServlet("/board/list.do")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1233004322957533062L;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ArticleService service = ArticleService.INSTANSE;
	
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		String group = request.getParameter("group");
		String cate = request.getParameter("cate");
		String pg = request.getParameter("pg");
		logger.debug("ListController group : " + group);
		logger.debug("ListController cate : " + cate);
		logger.debug("ListController pg : " + pg);

		request.setAttribute("group", group);
		request.setAttribute("cate", cate);
		request.setAttribute("pg", pg);
		
		
		int pageCount = 5;
		int start = 0;
		List<ArticleDTO> list 
			= service.selectPM(cate, start, pageCount);
		
		request.setAttribute("article", list);
		
		
		
		
		RequestDispatcher rd 
			= request.getRequestDispatcher("/board/list.jsp");
		rd.forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		super.doPost(request, response);
	}
}
