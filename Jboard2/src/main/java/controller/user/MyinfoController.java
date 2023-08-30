package controller.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

import service.UserService;

@WebServlet("/user/myInfo.do")
public class MyinfoController extends HttpServlet{
	private static final long serialVersionUID = 2797924285209869565L;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private UserService service = UserService.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd 
			= request.getRequestDispatcher("/user/myInfo.jsp");
		rd.forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		String kind = request.getParameter("kind");
		String uid = request.getParameter("uid");
		String pass = request.getParameter("pass");
		
		logger.debug("kind : " + kind);
		logger.debug("uid : " + uid);
		logger.debug("pass : " + pass);
		
		switch(kind) {
		case "WITHDRAW" :
			// ajax로 컨트롤러로 넘기면 json데이터로 돌려줘야 함
			// -> 바로 페이지 이동이 안됨
			// => 그래서 강제로 json 데이터를 출력하기위해 result를 넣어줌
			int result = service.updateUserForWithdraw(uid);
			
			JsonObject json = new JsonObject();
			json.addProperty("result", result);

			response.getWriter().print(json);
			logger.info("json : " + json);
			break;
		case "PASSWORD" :
			int result2 = service.updateUserPass(uid, pass);
			
			JsonObject json2 = new JsonObject();
			json2.addProperty("result", result2);

			response.getWriter().print(json2);
			logger.info("json : " + json2);
			break;
		case "Modify" :
			break;
		default :
			logger.error("넌 뭔데 여기서 찍히냐?");	
		}
		
		
	}
	
}
