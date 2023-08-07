<%@page import="vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserVO sessUser = (UserVO) session.getAttribute("sessUser");
	
	if(sessUser == null){
		/* forward 경로 설정
			- forward는 시스템 내에서 자원 이동이기 때문에
				서버 경로 대신 상대 경로로 지정
			- 처음에 /Jboard/index.jsp를 실행하기 때문에
				/Jboard/user/login.jsp를 하게 되면
				/Jboard/Jboard/user/login.jsp를 찾기때문에
				404가 뜨기 때문에 /user/login.jsp를 하는게
				절대 경로 지정 방법이다.
		*/
		pageContext.forward("/user/login.jsp");
	}else{
		pageContext.forward("list.jsp");
	}
%>