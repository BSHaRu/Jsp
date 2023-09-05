package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@WebServlet("/index.do")
public class IndexController extends HttpServlet {
	private static final long serialVersionUID = 1914377164192236485L;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {

		/* 일단 보류
		Cookie[] cookies = request.getCookies();
		 
		// cookie 존재 & 회원 가입 된 id 존재 & 로그인 정보 x 
		// -> 자동 로그인 처리 해줌 
		if(cookies != null 
			&& dto.UserDTO.getUid() == null 
			&& sessUser.getUid() != null) { 
				
			for(int i = 0; i < cookies.length; i++) { 
			 	logger.info(cookies[i].getName() + " : " + cookies[i].getValue());
			 
				 // 자동 로그인 체크를 했고, 가입 된 id가 일치하면 자동 로그인 처리
				 if(cookies[i].getName().equals("auto_login") 
						 && cookies[i].getValue().equals(sessUser.getUid())) { 
				 	//session 정보에 자동로그인 정보 추가
				 	session.setAttribute("sessUser", dto); sessUser = dto; 
 				} 
	 		} // 
	 	} // cookies not null
		*/ 
		
		RequestDispatcher rd 
			= request.getRequestDispatcher("/index.jsp");
		rd.forward(request, response);
	}
}
