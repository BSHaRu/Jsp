<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>1. Scritlet</title>
	<!-- 
		날짜 : 2023.07.24
		내용 : JSP 기본문법 실습
		
		스크립틀릿
		 - 정적문서(HTML)에 프로그래밍 코드를 기술하기 위한 코드 영역
		 - 동적문서(JSP) 스크립틀릿을 실행해서 정적문서(HTML)로 변환
		 
		표현식
		 - 변수 값을 출력하는 스크립트
		 - 간단한 값, 식 결과를 출력 
	-->
</head>
<body>
	<h3>1. 스크립틀릿</h3>
	
	<h4>스크립틀릿(Scriptlet)</h4>
	<%
		// 스크립트릿(자바 프로그래밍 영역)
		int var1 = 1;
		boolean var2 = true;
		double var3 = 3.14;
		String var4 = "Hello";
		
		out.println("<p>");
		out.println("var1 : " + var1);		
		out.println("</p>");
		
		out.println("<p>");
		out.println("var2 : " + var2);		
		out.println("</p>");
	%>
	
	<h4>표현식(Expression)</h4>
	<p>var3 : <%= var3 %></p>
	<p>var4 : <%= var4 %></p>
	
</body>
</html>