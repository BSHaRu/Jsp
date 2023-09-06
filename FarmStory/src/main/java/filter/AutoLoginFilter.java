package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.UserDTO;
import service.UserService;

// web.xml로 filter 매핑함
public class AutoLoginFilter extends HttpFilter implements Filter {
	private static final long serialVersionUID = 1490365971348404767L;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private UserService service = UserService.INSTANCS;
	
	public void doFilter(ServletRequest request, 
			ServletResponse response, FilterChain chain) throws IOException, ServletException {

		logger.info("AutoLoginFilter start -----------------");
		HttpSession session 
			= ((HttpServletRequest)request).getSession(); 
		
		UserDTO sessUser 
			= (UserDTO) session.getAttribute("sessUser");
		
		Cookie[] cookies 
			= ((HttpServletRequest) request).getCookies();
		logger.debug("AutoLoginFilter cookies : " + cookies);
		
		// cookie 존재 & 로그인 정보 x 
		// -> 자동 로그인 처리 해줌 
		if(cookies != null && sessUser == null) { 
			for(Cookie cookie : cookies) { 
			 	logger.debug(cookie.getName() + " : " + cookie.getValue());
			 
				 // 자동 로그인 체크를 했고, 쿠키가 있으면 자동 로그인 처리
				 if(cookie.getName().equals("userCookie")) { 
				 	//session 정보에 자동로그인 정보 추가
					UserDTO dto = service.selectCookie(cookie.getValue());
					logger.debug("AutoLoginFilter dto : " + dto);
					
				 	session.setAttribute("sessUser", dto);
				 	
 				} // if end 
	 		} // for > if end
		}else {
			logger.error("AutoLoginFilter 실행 안됨");
	 	} // cookies not null
		
		chain.doFilter(request, response);
	}
}
