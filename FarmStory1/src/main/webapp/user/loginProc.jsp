<%@page import="dto.*"%>
<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass");
	
	UserDAO dao = UserDAO.getInstansce();
	UserDTO dto = dao.selectUser(uid, pass);
	
	// 회원인지 확인
	if(dto != null){
		session.setAttribute("sessUser", dto);
		response.sendRedirect("/FarmStory1/index.jsp");
	}else{
		out.print("<script>");
		out.print("alert('등록된 회원이 아니거나 비밀번호가 틀립니다.');");
		out.print("history.back();");
		out.print("</script>");
	}
%>