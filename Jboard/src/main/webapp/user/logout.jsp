<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 현재 세션 완전히 제거
	// -> 세션에 저장된 모든데이터 삭제
	// 클라이언트와 서버 연결 해제
	// -> 보안과 세션 관리가 강화
	// => 로그아웃
	session.invalidate();

	// 해당 세션의 이름만 제거
	// -> 다른 세션의 데이터는 유지되어 있음
	// => 장바구니의 특정 상품 제거
	// session.removeAttribute("sessUser");

	response.sendRedirect("/Jboard/user/login.jsp");

%>