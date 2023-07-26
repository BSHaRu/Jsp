<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>7_Scope</title>
</head>
<body>
	<h3>7. Scope</h3>
	<%
		// 내장객체 값 설정
		pageContext.setAttribute("name", "김유신");
		request.setAttribute("name", "김춘추");
		session.setAttribute("name", "홍길동");
		application.setAttribute("name", "고길동");
	%>
	
	<h4>내장 객체 값 확인</h4>
	<p>
		pageContext : <%= pageContext.getAttribute("name") %> <br/>
		request : <%= request.getAttribute("name") %> <br/>
		session : <%= session.getAttribute("name") %> <br/>
		application : <%= application.getAttribute("name") %> <br/>
	</p>
	
	<%
		pageContext.forward("./proc/scpeResult.jsp");
	%>
	
</body>
</html>