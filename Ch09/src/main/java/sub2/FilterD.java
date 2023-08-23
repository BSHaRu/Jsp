package sub2;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter(urlPatterns = {
		"/welcome.do",
		"/greeting.do"
})
public class FilterD implements Filter{

	@Override
	public void doFilter(ServletRequest request, 
			ServletResponse response, FilterChain chain)
					throws IOException, ServletException {
		// filter 로직
		System.out.println("FilterD doFilter");
		
		// 필터 호출, 필터가 없으면 최종 자원 요청
		// -> 요청이 처리되기전에 먼저 인코딩이 진행되어야함.
		chain.doFilter(request, response);
	}

}
