package controller.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.UserDTO;
import service.UserService;

@WebServlet("/user1/list")
public class UserListController extends HttpServlet {
	private static final long serialVersionUID = 4798716152489509696L;

	private UserService service = new UserService();
	
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		List<UserDTO> users = service.selectUsers();
		
		// view에서 users 참조하기 위해 request Scope 저장
		request.setAttribute("users", users);
		
		RequestDispatcher rd 
			= request.getRequestDispatcher("/user1/list.jsp");
		rd.forward(request, response);
	}
}
