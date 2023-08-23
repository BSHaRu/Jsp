package sub1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class HelloServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	// was가 최초 실행 될 때 한 번만 요청
	@Override
	public void init() throws ServletException {
		System.out.println("Servlet init() 실행");
	}
	
	// 클라이언트가 GET 방식으로 요청할 때 실행
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("===============================");
		System.out.println("Servlet get() 전송");
		
		// HTML 출력
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter writer = resp.getWriter();
		writer.print("<html>");
		writer.print("<head>");
		writer.print("<meta charset='UTF-8'>");
		writer.print("<title>Hello Servlet</title>");
		writer.print("</head>");
		writer.print("<body>");
		writer.print("<h3>ㅎㅇ염<h3>");
		writer.print("<a href='./1_Servlet.jsp'>메인</a>");
		writer.print("<br/>");
		writer.print("<a href='./hello.do'>서블릿</a>");
		writer.print("</body>");
		writer.print("</html>");
		
		writer.close();
	}
	
	// 클라이언트가 post 방식으로 요청할 때 실행
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("===============================");
		System.out.println("Servlet post() 전송");
		
		String uid = req.getParameter("uid");
		String pw = req.getParameter("pw");
		
		// 현재 세션 가져오기
		HttpSession session = req.getSession();
		
		if(uid.equals("aaa") && pw.equals("aaa")) {
			session.setAttribute("sessUser", uid);
			System.out.println("uid");
			session.setAttribute("sessPw", pw);
			System.out.println("pw");
			resp.sendRedirect("/Ch09/3_Listener.jsp?success=200");
		}else {
			resp.sendRedirect("/Ch09/3_Listener.jsp?success=100");
		}
	}
	
	// 서블릿이 종료 될 때 실행
	@Override
	public void destroy() {
		System.out.println("===============================");
		System.out.println("Servlet destroy()...");
	}
}
