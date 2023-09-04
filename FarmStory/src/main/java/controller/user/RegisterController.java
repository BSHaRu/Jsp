package controller.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.UserDTO;
import service.UserService;

@WebServlet("/user/register.do")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 3914377164192236485L;
	
	private UserService service = UserService.INSTANCS;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd 
			= request.getRequestDispatcher("/user/register.jsp");
		rd.forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		String uid = request.getParameter("uid");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		String nick = request.getParameter("nick");
		String email = request.getParameter("email");
		String hp = request.getParameter("hp");
		String role = request.getParameter("role");
		String zip = request.getParameter("zip");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");	
		String regIp = request.getRemoteAddr();
		
		UserDTO dto = new UserDTO();
		dto.setUid(uid);
		dto.setPass(pass);
		dto.setName(name);
		dto.setNick(nick);
		dto.setEmail(email);
		dto.setHp(hp);
		dto.setRole(role);
		dto.setZip(zip);
		dto.setAddr1(addr1);
		dto.setAddr2(addr2);
		dto.setRegIp(regIp);
		
		service.insertUser(dto);
		
		logger.info("RegisterController_Post UserDTO : " + dto);
		
		response.sendRedirect("/FarmStory/user/login.do");
	}
}
