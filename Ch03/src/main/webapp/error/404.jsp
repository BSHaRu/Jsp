<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>페이지를 찾을 수 없습니다.</title>
</head>
<body>
	<h3>요청하신 페이지가 없습니다.</h3>
	<%-- 이 내용 주석 처리하면 404 error가 우리가 만든걸로 뜸
		<p>
			에러 종류 : <%= exception.getClass().getName() %>
			에러 내용 : <%= exception.getMessage() %>
		</p> 
	--%>
	<a href="../6_exception.jsp"></a>
</body>
</html>