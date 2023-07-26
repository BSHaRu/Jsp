<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>2_include</title>
	<!--  
		날짜 : 2023.07.26
		내용 : JSP include 액션 태그 실습
		
		include 지시자(디렉티브)
		 - 일반적으로 UI 모듈
		 - 공통 전역 파일을 삽입할 때 사용하는 지시자
		 - 정적 타입에 삽입
		
		include 액션 태그
		 - UI 모듈 위주로 삽입하는 include 태그
		 - 동적 타입에 삽입(RunTime)
	-->
</head>
<body>
	<h3>2. include</h3>
	
	<h4>include 지시자</h4>
	<%@ include file="./inc/header.jsp" %>
	<%@ include file="./inc/footer.jsp" %>
	<%@ include file="./inc/config1.jsp" %>
	<p>
		num1 : <%= num1 %> <br/>
		num2 : <%= num2 %> <br/>
		num3 : <%= num3 %> <br/>
	</p>
	
	<hr/>
	
	<h4>include 태그</h4>
	<jsp:include page="./inc/header.jsp" />
	<jsp:include page="./inc/footer.jsp" />
	<jsp:include page="./inc/config2.jsp" />	
	<%-- 오류 뜸
	<p>
		var1 : <%= var1 %> <br/>
		var2 : <%= var2 %> <br/>
		var3 : <%= var3 %> <br/>
	</p> 
	--%>
	
	<hr/>
	
	<h4>include 메서드</h4>
	<%
		pageContext.include("./inc/header.jsp");
		pageContext.include("./inc/footer.jsp");
	%>
	
</body>
</html>