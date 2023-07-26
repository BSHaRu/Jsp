<%@page import="sub1.UserVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>5_Session</title>
	<!--  
		날짜 : 2023.07.26
		내용 : JSP session 내장 객체 실습
		
		session
		 - session은 최초 요청부터 마지막 요청까지의 전체 시간 경과
		 - 클라이언트 대응되는 객체
		 - 서버(WAS)에 기록되는 클라이언트 고유 번호(Session Table)
		 - 서버(WAS)는 각 클라이언트에 대한 고유 식별 번호(Session ID)를 자동으로 발급
	-->
</head>
<body>
	<h3>5. Session 내장 객체</h3>
	
	<h4>session ID 확인</h4>
	<%= session.getId() %>
	
	<h4>session 설정</h4>
	<%
		UserVo user = new UserVo("a101", "김유신", "010-1234-1111", 23);
		// key, value값으로 저장
		// -> session table에 userColum칼럼명으로 user객체 저장
		session.setAttribute("userColum", user);
		
		// session table에 저장된 userColum 칼럼 값을 가져옴
		UserVo userVo 
			= (UserVo) session.getAttribute("userColum");
	%>
	<p>
		아이디 : <%= userVo.getUid() %> <br />
		이름 : <%= userVo.getName() %> <br />
		연락처 : <%= userVo.getHp() %> <br />
		나이 : <%= userVo.getAge() %> <br />
	</p>
	
</body>
</html>