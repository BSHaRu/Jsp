package controller;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDTO;
import service.MemberService;

@WebServlet("/register.do")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = -6833184325371361163L;

	// enum을 활용한 싱글톤 객체
	private MemberService service = MemberService.INSTANSE;
	
	// java 기본 log
	private Logger logger = Logger.getGlobal();
	
	@Override
	public void init() throws ServletException {
		logger.info("RegisterController init() 1");
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("RegisterController doGet() 2");
		
		
		RequestDispatcher rd 
			= request.getRequestDispatcher("/register.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("RegisterController doPost() 3");
		
		String uid = request.getParameter("uid");
		String name = request.getParameter("name");
		String hp = request.getParameter("hp");
		String pos = request.getParameter("pos");
		String dep = request.getParameter("dep");
		
		MemberDTO dto = new MemberDTO();
		dto.setUid(uid);
		dto.setName(name);
		dto.setHp(hp);
		dto.setPos(pos);
		dto.setDep(Integer.parseInt(dep));
		
		logger.info("RegisterController doPost() - dto : " +dto);
		
		service.insertMember(dto);
		
		response.sendRedirect("/Ch11/list.do");
	}

}
