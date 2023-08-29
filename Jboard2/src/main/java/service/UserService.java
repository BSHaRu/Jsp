package service;

import java.util.*;
import java.util.concurrent.ThreadLocalRandom;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dao.UserDAO;
import dto.UserDTO;

public class UserService {
	
	public static UserService instance = new UserService();
	public static UserService getInstance() {
		return instance;
	}
	private UserService () {}
	
	private UserDAO dao = UserDAO.getInstance();
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 인증코드 문자열로 받기
	// 인증 코드값은 모든 객체에서 동일하게 사용되어야 하기 때문에 정적 변수로 둠
	private static String generatedCode;
	
	
	public void insertUser(UserDTO dto) {
		dao.insertUser(dto);
	}
	
	public UserDTO selectUser(String uid, String pass) {
		return dao.selectUser(uid, pass);
	}
	
	public List<UserDTO> selectUsers() {
		return dao.selectUsers();
	}
	
	public void updateUser(UserDTO dto) {
		dao.updateUser(dto);
	}
	
	public void deleteUser(String uid) {
		dao.deleteUser(uid);
	}
	
	public int checkUid(String uid) {
		return dao.checkUid(uid);
	}
	public int checkNick(String nick) {
		return dao.checkNick(nick);
	}
	public int checkEmail(String email) {
		return dao.checkEmail(email);
	}
	public int checkHp(String hp) {
		return dao.checkHp(hp);
	}
	
	// email code 전송
	public String sendEmailCode(String receiver) {
		
		// 인증 코드 생성
		int code
			= ThreadLocalRandom.current().nextInt(100000, 1000000);
		
		// code를 문자열로 바꿔주는 작업 
		generatedCode = code+"";
		
		//Gmail SMTP 기본 정보
		String sender = "show5901@gmail.com";
		String pw = "xsgyikfwqsayysbc";
		String title = "[PJ_test_code]";
		String content = "<H1>인증코드는 " + generatedCode + "</h1>";

		// Gamil SMTP 서버 설정
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		// 465포트보다 587포트가 보안↑, 범위↑
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		// Gmail STMP 세션 생성
		Session sess = Session.getInstance(props, new Authenticator(){
			@Override
			protected PasswordAuthentication getPasswordAuthentication(){
				return new PasswordAuthentication(sender, pw);
			}
		});
		
		// 메일 발송
		Message message = new MimeMessage(sess);
		try{
			message.setFrom(new InternetAddress(sender, "보내는사람", "UTF-8"));
			message.addRecipient(
					Message.RecipientType.TO, new InternetAddress(receiver));
			message.setSubject(title);
			message.setContent(content, "text/html;charset=UTF-8");
			Transport.send(message);
			
			logger.info("전송 완료");
		}catch(Exception e){
			logger.error("email code : " + e.getMessage());
		}
		
		return generatedCode;
	} // sendEmailCode end
	
	// code 검증 확인
	public int confirmCode(String code) {
		if(code.equals(generatedCode)) 
			return 0;
		else
			return 1;
	}
	
}
