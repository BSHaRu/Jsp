package sub3;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/* ServletContextListener
	- 웹 애플리케이션의 시작 및 종료에 대한 이벤트 처리
	- ServletContext 참조 
*/
public class ContextListener implements ServletContextListener{

	public ContextListener() {
		System.out.println("ContextListener 생성");
	}
	
	// 웹 애플리케이션 시작 시 초기화 작업 
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("contextInitialized 실행");
	}
	
	// 웹 애플리케이션 종료 시 정리 작업
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		System.out.println("contextDestroyed 실행");
	}
}
