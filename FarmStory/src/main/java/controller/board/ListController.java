package controller.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ArticleDTO;
import service.ArticleService;

@WebServlet("/board/list.do")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1233004322957533062L;

	//private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ArticleService service = ArticleService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		String group = request.getParameter("group");
		String cate = request.getParameter("cate");
		String pg = request.getParameter("pg");
		
		/*
		 * logger.debug("ListController group : " + group);
		 * logger.debug("ListController cate : " + cate);
		 * logger.debug("ListController pg : " + pg);
		 */

		request.setAttribute("group", group);
		request.setAttribute("cate", cate);
		request.setAttribute("pg", pg);
		
		
		// 현재 페이지 번호
		int currentPage = service.getCurrentPage(pg);
		
		// 시작 인덱스
		int pageCount = 5;
		int start = service.getStartNum(currentPage, pageCount);
		
		// 전체 게시물 갯수 
		int total = service.selectCountTotal(cate);
		
		// 마지막 페이지 번호
		int lastPageNum = service.getLastPageNum(total, pageCount);
		
		// 페이지 그룹 start, end 번호
		int[] result 
			= service.getPageGroupNum(currentPage, lastPageNum, pageCount);
		
		// 페이지 시작번호
		int pageStartNum = service.getPageStartNum(total, currentPage, pageCount);
		
		
		List<ArticleDTO> list 
			= service.selectPM(cate, start, pageCount);
		
		request.setAttribute("article", list);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("lastPageNum", lastPageNum);
		request.setAttribute("pageGroupStart", result[0]);
		request.setAttribute("pageGroupEnd", result[1]);
		request.setAttribute("pageStartNum", pageStartNum+1);
		
		RequestDispatcher rd 
			= request.getRequestDispatcher("/board/list.jsp");
		rd.forward(request, response);
	}
}
