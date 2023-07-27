<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sessid = (String) session.getAttribute("sessid");

	// 로그인 안하고 주소창을 통해서 들어왔을 경우
	if(sessid == null){
		response.sendRedirect("./loginFrom.jsp");
		return;
	}
%>    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>loginSuccess</title>
</head>
<body>
	<h3>로그인 성공</h3>
	<p>
		<%= sessid %>님 반갑습니다.<br/>
		<a href="./logout.jsp">로그 아웃</a>
	</p>
	
</body>
</html>