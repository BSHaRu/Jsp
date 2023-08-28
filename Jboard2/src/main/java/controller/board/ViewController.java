package controller.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/view.do")
public class ViewController extends HttpServlet {
	private static final long serialVersionUID = 5834848870442465215L;

	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd 
			= request.getRequestDispatcher("view.jsp");
		rd.forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest requset, 
			HttpServletResponse response) throws ServletException, IOException {
		
	}
	
}
