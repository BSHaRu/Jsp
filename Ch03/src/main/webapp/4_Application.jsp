<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>4_Application</title>
	<!--
		날짜 : 2023.07.25
		내용 : JSP application 내장 객체 실습
		
		application
		 - 현재 웹 애플리케이션을 실행하는 WAS(tomcat)의 환경 객체
		 - 서버 환경값(Context)를 설정하고 참조
		 	- 로그 작업 지원
	-->
</head>
<body>
	<h3>4. Application 내장(서버) 객체</h3>
	
	<h4>서버 정보</h4>
	<%= application.getServerInfo() %>
	
	<h4>파라미터 정보</h4>
	<%
		// web.xml 파일에 정의한 값을 불러오는거임
		String value1 = application.getInitParameter("Param1");
		String value2 = application.getInitParameter("Param2");
	%>
	<p>
		value1 = <%= value1 %> <br/>
		value2 = <%= value2 %> <br/>
	</p>
	
	<h4>로그 정보</h4>
	<%
		application.log("log 기록");
	%>
	
	<h4>자원 경로</h4>
	<!-- getRealPath : 실제 경로가 어떻게 되는지 알아보는거
		톰캣 서버에서 Serve modules without publishing를
		체크 한거랑 안한거랑 경로 차이가 있으니 참고!!
		체크를 안해야 .metadata로 경로가 잡히고
		체크를 하게되면 이클립스 파일과 동일하게 경로 잡힘 
	-->
	<%= application.getRealPath("./4_Application.jsp") %>
	
</body>
</html>