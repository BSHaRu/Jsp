<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>서버 error</title>
</head>
<body>
	<h3>일시적으로 서버가 문제 생겼습니다.</h3>
	<p>
		에러 종류 : <%= exception.getClass().getName() %>
		에러 내용 : <%= exception.getMessage() %>
	</p>
	<a href="../6_exception.jsp"></a>
</body>
</html>