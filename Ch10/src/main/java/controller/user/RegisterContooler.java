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

@WebServlet("/user1/register")
public class RegisterContooler extends HttpServlet {
	private static final long serialVersionUID = -8682952215759753650L;
	
	private UserService service = new UserService();
	
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher path
			= request.getRequestDispatcher("/user1/register.jsp");
		path.forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		String uid = request.getParameter("uid");
		String name = request.getParameter("name");
		String hp = request.getParameter("hp");
		String strAge = request.getParameter("age");
		int age = Integer.parseInt(strAge);
		
		UserDTO dto = new UserDTO();
		dto.setUid(uid);
		dto.setName(name);
		dto.setHp(hp);
		dto.setAge(age);
		
		service.insertUser(dto);
		
		response.sendRedirect("list");
	}
	
}
