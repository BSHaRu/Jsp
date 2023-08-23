package sub2;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class FilterA implements Filter{
	// web.xml에 설정한 init-param을 쓰기 위해서 필드 선언
	/* 수업 안해서 생략
	 * String encodingName; 
	 * String requestMethod;
	 */
	
	@Override
	public void doFilter(ServletRequest request, 
			ServletResponse response, FilterChain chain)
					throws IOException, ServletException {
		// filter 로직
		System.out.println("FilterA doFilter");
		
		/* 수업내용에서 안다뤄서 일단 생략
		   // Http를 붙여서 사용 하는 이유 : 전송 방식을 알려줌
		   // -> 그냥 Servlet만 있으면 그걸 모르기때문에 Http로 타입변환해주는거임  
		   // => Servlet이 최상위객체 ==> Servlet > HttpServlet 
		   HttpServletRequest req = (HttpServletRequest)request;  
		   String method = req.getMethod();
		   System.out.println("전송방식 : " +method); 
		   
		   // requestMethod가 post 방식으로 저장해놨음
		   if(method.equals(requestMethod)) { 
		     // encodingName에 UTF-8이 저장되어있음
			 request.setCharacterEncoding(encodingName); 
			 System.out.println(encodingName + " 인코딩 완료"); 
		   }
		 */
		
		// 필터 호출, 필터가 없으면 최종 자원 요청
		// -> 요청이 처리되기전에 먼저 인코딩을 해줘야 안깨짐.
		chain.doFilter(request, response);
	}

}
