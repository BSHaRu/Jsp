<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>6_exception</title>
	<!--  
		날짜 : 2023.07.26
		내용 : exception 내장 객체 실습
		
		exception
		 - JSP 예외가 발생 했을 때 예외를 처리하기 위한 내장객체
		 - 간접적으로 exception 객체를 통해 error code별로 error page 작성
		 
		주요 응답 코드
		 - 200 : 요청 성공
		 - 3xx : redirect
		 - 404 : 페이지 없음
		 - 500 : 서버 내부 에러  
	-->
</head>
<body>
	<h3>6 exception 내장 객체</h3>
	
	<a href="./sample.jsp">404 error</a>
	<a href="./proc/exception.jsp">500 error</a>
	
	
</body>
</html>