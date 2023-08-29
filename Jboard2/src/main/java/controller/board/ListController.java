package controller.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.UserDTO;

@WebServlet("/list.do")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = -5208933405264979414L;

	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		UserDTO sessUser = (UserDTO) session.getAttribute("sessUser");
		
		if(sessUser != null) {
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
