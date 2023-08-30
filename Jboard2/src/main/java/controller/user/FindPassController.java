package controller.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/user/findPass.do")
public class FindPassController extends HttpServlet{
	private static final long serialVersionUID = -2915285033346876348L;

	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd 
			= request.getRequestDispatcher("/user/findPass.jsp");
		rd.forward(request, response);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		String uid = request.getParameter("uid");
		
		HttpSession session = request.getSession();
		
		// request로 넘기면 redirect로 get방식으로 findPassChange 컨트롤러 갔다가 
		// view를 보여주기 때문에 request값이 사라져서 session으로 해줌
		session.setAttribute("uid", uid);
		
		response.sendRedirect("/Jboard2/user/findPassChange.do");
	}
	
}
