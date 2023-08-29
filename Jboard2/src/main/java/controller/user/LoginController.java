package controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.UserDTO;
import service.UserService;

@WebServlet("/user/login.do")
public class LoginController extends HttpServlet{
	private static final long serialVersionUID = -836676941961684118L;

	private UserService service = UserService.getInstance();
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd 
			= request.getRequestDispatcher("/user/login.jsp");
		rd.forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		String uid = request.getParameter("uid");
		String pass = request.getParameter("pass");
		
		UserDTO dto = service.selectUser(uid, pass);
		
		// 이거 설정 안해주면 script에서 한글 깨짐
		response.setContentType("text/html;charset=utf-8");
		if(dto != null) {
			HttpSession session = request.getSession();
			
			session.setAttribute("sessUser", dto);
			
			response.sendRedirect("/Jboard2/list.do");
		}else {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('등록된 아이디가 아니거나 비밀번호가 틀렸습니다.');");
			out.print("location.href='/Jboard2/user/login.do';");
			out.print("</script>");
			out.close();
		}
		
	}
	
}
