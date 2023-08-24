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

@WebServlet("/user1/modify")
public class ModifyController extends HttpServlet{
	private static final long serialVersionUID = -3404454646464251123L;
	
	private UserService service = new UserService();
	
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		String uid = request.getParameter("uid");
		UserDTO user = service.selectUser(uid);
		
		request.setAttribute("user", user);
		
		RequestDispatcher rd
			= request.getRequestDispatcher("/user1/modify.jsp");
		rd.forward(request, response);
		
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
		
		service.updateUser(dto);
		response.sendRedirect("list");
	}
}
