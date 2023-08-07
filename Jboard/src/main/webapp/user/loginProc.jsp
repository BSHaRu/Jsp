<%@page import="dao.UserDAO"%>
<%@page import="vo.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass");
	
	UserVO vo = UserDAO.getInstance().selectUser(uid, pass);
	
	// 회원 여부 확인
	if(vo != null){
		session.setAttribute("sessUser", vo);
		response.sendRedirect("/Jboard/list.jsp");
	}else{
		// success=100은 큰 의미없고
		// 실패를 내기 위한 값이래
		response.sendRedirect("/Jboard/user/login.jsp?success=100");
	}
	
%>
