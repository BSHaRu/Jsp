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

		//데이터 수신 
		String pg = request.getParameter("pg");
		String search = request.getParameter("search");
		
		// 현재 페이지 번호
		int currentPage = service.getCurrentPage(pg);
		
		// 시작 인덱스
		int pageCount = 5;
		int start = service.getStartNum(currentPage, pageCount);
		
		// 전체 게시물 갯수 
		int total = service.selectCountTotal(search);
		
		// 마지막 페이지 번호
		int lastPageNum = service.getLastPageNum(total, pageCount);
		
		// 페이지 그룹 start, end 번호
		int[] result 
			= service.getPageGroupNum(currentPage, lastPageNum, pageCount);
		
		// 페이지 시작번호
		int pageStartNum = service.getPageStartNum(total, currentPage, pageCount);
		
		if(sessUser != null) {
			
			List<ArticleDTO> list = service.selectArticles(start, pageCount, search);
			logger.info("ListController list : " + list);
			
			request.setAttribute("article", list);
			request.setAttribute("search", search);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("lastPageNum", lastPageNum);
			request.setAttribute("pageGroupStart", result[0]);
			request.setAttribute("pageGroupEnd", result[1]);
			request.setAttribute("pageStartNum", pageStartNum+1);
			
			logger.info("ListController search : " + search);
			logger.info("ListController currentPage : " + currentPage);
			logger.info("ListController lastPageNum : " + lastPageNum);
			logger.info("ListController pageGroupStart : " + result[0]);
			logger.info("ListController pageGroupEnd : " + result[1]);
			logger.info("ListController pageStartNum : " + pageStartNum);
			
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
