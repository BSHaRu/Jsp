<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>2_표현언어 내장객체</title>
</head>
<body>
	<h3>2. 표현언어 내장객체</h3>
	<%
		pageContext.setAttribute("name", "pageContext");
		request.setAttribute("name", "request");
		session.setAttribute("name", "session");
		application.setAttribute("name", "application");
	%>
	<p>
		pageScope name : ${name } <br/>
		requestScope name : ${requestScope.name } <br/>
		sessionScope name : ${sessionScope.name } <br/>
		applicationScope name : ${applicationScope.name } <br/>
	</p>
	
</body>
</html>