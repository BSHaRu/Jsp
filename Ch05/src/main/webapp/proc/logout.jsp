<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// session은 1명에 대한 클라이언트를 건드림
	// invalidate() : session에서 해당 클라이언트 삭제
	session.invalidate();

	// 쿠키 해제
	Cookie cookie = new Cookie("cid","");
	cookie.setMaxAge(0);
	response.addCookie(cookie);

	response.sendRedirect("./loginForm.jsp");
%>