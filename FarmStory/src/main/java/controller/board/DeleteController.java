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

@WebServlet("/board/delete.do")
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 6233004322957533062L;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ArticleService service = ArticleService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		String group = request.getParameter("group");
		String strNo = request.getParameter("no");
		int no = Integer.parseInt(strNo);
		
		ArticleDTO dto = service.selectArticle(no);
		request.setAttribute("article", dto);
		request.setAttribute("group", group);
		
		RequestDispatcher rd 
			= request.getRequestDispatcher("/board/modify.jsp");
		rd.forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		String strNo = request.getParameter("no");
		String cate = request.getParameter("cate");
		String group = request.getParameter("group");
		int no = Integer.parseInt(strNo);
		
		logger.debug("group : " + group);
		
		ArticleDTO dto = new ArticleDTO();
		dto.setNo(no);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setCate(cate);
		
		service.updateArticle(dto);
		logger.debug("modifyPost_DTO : "+dto);
		
		response.sendRedirect("/FarmStory/board/view.do?group="+group+"&cate="+cate+"&no="+no);
	}
}
