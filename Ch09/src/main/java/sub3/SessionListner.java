package sub3;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

@WebListener
public class SessionListner implements HttpSessionAttributeListener {

	int count = 0;
	
	public SessionListner() {
		System.out.println("SessionListner 실행");
	}
	
	@Override
	public void attributeAdded(HttpSessionBindingEvent event) {
		System.out.println("attributeAdded 호출");
		count++;
		System.out.println("로그인 사용자 수 : " + count);
	}
	
	@Override
	public void attributeRemoved(HttpSessionBindingEvent event) {
		System.out.println("attributeRemoved 호출");
		count--;
		System.out.println("로그인 사용자 수 : " + count);
	}
}
