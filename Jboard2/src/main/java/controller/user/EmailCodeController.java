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

@WebServlet("/user/EmailCode.do")
public class EmailCodeController extends HttpServlet {
	private static final long serialVersionUID = 402284503312795026L;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private UserService service = UserService.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		String type = request.getParameter("type");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		logger.info("1");
		
		PrintWriter pw =  response.getWriter();
		
		int result = 0;
		String code = "";
		if(type.equals("register")) {
			// 회원 가입시 인증 코드 발송
			code = service.sendEmailCode(email);
			result = service.checkEmail(email);
			logger.info("EmailCode_Get_Register result : " + result);
		}else if(type.equals("findId")) {
			result = service.checkNameAndEmail(name, email);
			logger.info("EmailCode_Get_FindId result : " + result);
			if(result == 0) {
				// 등록된 이메일이 아닐 경우
				pw.print("<script>");
				pw.print("alert('이름과 등록된 이메일이 다릅니다. 다시 확인해 주세요');");
				pw.print("</script>");
				pw.close();
				logger.info("위에껄 실행 시키고 click이 실행 되는데 어쩌지?");
				return;
			}else {
			// id 찾기 시 인증 코드 발송
			/*
			 * UserDTO dto = new UserDTO(); dto.setName(name); dto.setEmail(email);
			 * 
			 * dto = service.findIdForEmailInResult(name, email);
			 * 
			 */
			code = service.sendEmailCode(email);
			}
		}else {
			logger.info("넌 뭐냐?");
		}
		// code = service.sendEmailCode(email);
		
		// JSON 생성
		JsonObject json = new JsonObject();
		json.addProperty("code", code);
		logger.info("EmailCode code : " + code);
		
		// JSON 출력
		pw.print(json.toString());
		pw.close();
	}
	
	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("code");
		
		int result = service.confirmCode(code);
		
		// JSON 생성
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		logger.info("EmailCode_Post result : " + result);
		
		// JSON 출력
		PrintWriter pw =  response.getWriter();
		pw.print(json.toString());
		pw.close();
	}
}
