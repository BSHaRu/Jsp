package controller.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.UserDTO;
import service.UserService;

@WebServlet("/user/findIdResult.do")
public class FindIdResultController extends HttpServlet{
	private static final long serialVersionUID = -7017281174660883610L;

	private UserService service = UserService.getInstance();
	
	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		UserDTO dto = service.findIdForEmailInResult(name, email);
		request.setAttribute("user", dto);
		
		
		RequestDispatcher rd 
			= request.getRequestDispatcher("/user/findIdResult.jsp");
		rd.forward(request, response);
	}
	
}
