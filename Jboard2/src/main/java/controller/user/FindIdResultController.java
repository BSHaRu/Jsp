package controller.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/findIdResult.do")
public class FindIdResultController extends HttpServlet{
	private static final long serialVersionUID = -7017281174660883610L;

	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd 
			= request.getRequestDispatcher("/user/findIdResult.jsp");
		rd.forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest requset, 
			HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	
}
