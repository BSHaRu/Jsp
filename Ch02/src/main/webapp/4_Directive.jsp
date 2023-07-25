<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="ⓒ copyright haru.com" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>4. Directive</title>
	<!--
		지시자(Directive)
		 - JSP 페이지에 추가적인 정보를 설정하는 스크립트 문법
		 - 스크립트릿, 표현식과 함께 JSP 기본 구성요소 
	-->
</head>
<body>
	<h3>4. 지시자</h3>
	
	<h4>page 지시자</h4>
	<p>
		page copyright : <%= getServletInfo() %>
	</p>
	
	<h4>include 지시자</h4>
	<!-- 
		 include file="파일명"
		 - 현재 JSP 페이지와 같은 디렉토리면 파일명만 설정
		 - 그렇지 않으면 전체 URL(or 상대 경로)로 설정
	-->
	<%@ include file="./inc/header.jsp" %>
	<%@ include file="./inc/footer.jsp" %>
	
</body>
</html>