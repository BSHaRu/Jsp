package controller.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.TermsDTO;
import service.TermsService;

@WebServlet("/user/terms.do")
public class TermsController extends HttpServlet {
	private static final long serialVersionUID = -3509998783859934220L;

	private TermsService service = new TermsService();
	
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		TermsDTO dto = service.selectTerms();
		
		request.setAttribute("terms", dto);
		
		RequestDispatcher rd 
			= request.getRequestDispatcher("/user/terms.jsp");
		rd.forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest requset, 
			HttpServletResponse response) throws ServletException, IOException {
		
	}
	
}
