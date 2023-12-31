package controller.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/user/findPassChange.do")
public class FindPassChangeController extends HttpServlet {
	private static final long serialVersionUID = -3700244220596614949L;

	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("uid");
		
		if(uid == null) {
			response.sendRedirect("/user/findPass.do");
		}else {
			RequestDispatcher rd 
				= request.getRequestDispatcher("/user/findPassChange.jsp");
			rd.forward(request, response);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		
		
	}
}
