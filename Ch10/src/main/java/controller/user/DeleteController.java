package controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.UserService;

@WebServlet("/user1/delete")
public class DeleteController extends HttpServlet{
	private static final long serialVersionUID = -5893987966803663227L;

	private UserService service = new UserService();
	
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		String uid = request.getParameter("uid");
		service.deleteUser(uid);
		
		response.sendRedirect("list");
	}
}
