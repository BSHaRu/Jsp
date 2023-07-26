<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>scpeResult</title>
</head>
<body>
	<h3>내장 객체 값 확인</h3>
	<p>
		pageContext : <%= pageContext.getAttribute("name") %> <br/>
		request : <%= request.getAttribute("name") %> <br/>
		session : <%= session.getAttribute("name") %> <br/>
		application : <%= application.getAttribute("name") %> <br/>
	</p>
	
	<a href="/Ch03/proc/scpeResult.jsp">결과 확인</a>
	
</body>
</html>