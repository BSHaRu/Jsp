package filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.UserDTO;

// web.xml로 filter 매핑함
public class CheckLoginFilter extends HttpFilter implements Filter {
	private static final long serialVersionUID = 5490365971348404767L;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void doFilter(ServletRequest request, 
			ServletResponse response, FilterChain chain) throws IOException, ServletException {

		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpSession session = httpRequest.getSession();
		
		UserDTO sessUser 
			= (UserDTO) session.getAttribute("sessUser");
		
		if(sessUser != null) {
			logger.debug("filter sessUser not null");
			chain.doFilter(request, response);
		}else {
			// 다음 필터 호출, 필터 없으면 최종 자원 요청
			logger.debug("filter sessUser is null");
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter pw = response.getWriter();
			pw.print("<script>");
			pw.print("alert('로그인 부터 해주시기 바랍니다.');");
			pw.print("location.href='/FarmStory/user/login.do?=300';");
			pw.print("</script>");
			pw.close();
		}
	}
}
