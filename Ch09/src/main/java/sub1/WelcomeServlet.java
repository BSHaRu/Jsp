package sub1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WelcomeServlet extends HttpServlet{

	private static final long serialVersionUID = 3993408389362127219L;

	@Override
	public void init() throws ServletException {
		System.out.println("Welcome Servlet init()");
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("===============================");
		System.out.println("Welcome Servlet get() 전송");
		
		// HTML 출력
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter writer = resp.getWriter();
		writer.print("<html>");
		writer.print("<head>");
		writer.print("<meta charset='UTF-8'>");
		writer.print("<title>Welcome Servlet</title>");
		writer.print("</head>");
		writer.print("<body>");
		writer.print("<h3>ㅎㅇ염<h3>");
		writer.print("<a href='./1_Servlet.jsp'>메인</a>");
		writer.print("<br/>");
		writer.print("<a href='./hello.do'>servlet</a>");
		writer.print("<br/>");
		writer.print("<a href='./welcome.do'>welcome servlet</a>");
		writer.print("</body>");
		writer.print("</html>");
		writer.close();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("===============================");
		System.out.println("Welcome Servlet post() 전송");
	}
	
	@Override
	public void destroy() {
		System.out.println("===============================");
		System.out.println("Welcome Servlet destroy()");
	}
	
}
