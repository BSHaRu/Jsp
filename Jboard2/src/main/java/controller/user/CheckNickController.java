package controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

import service.UserService;

@WebServlet("/user/checkNick.do")
public class CheckNickController extends HttpServlet {
	private static final long serialVersionUID = 202284503312795026L;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private UserService service = UserService.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		String nick = request.getParameter("nick");
		int result = service.checkNick(nick);
		
		// JSON 생성
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		logger.info("checkNick result : " + result);
		
		// JSON 출력
		PrintWriter pw =  response.getWriter();
		pw.print(json.toString());
		pw.close();
	}
}
