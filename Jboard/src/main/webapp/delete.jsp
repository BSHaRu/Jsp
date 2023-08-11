<%@page import="dao.*"%>
<%@page import="vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String strNo = request.getParameter("no");
	int no = Integer.parseInt(strNo);
	
	ArticleDAO dao = new ArticleDAO();
	dao.deleteArticle(no);
	
	response.sendRedirect("/Jboard/list.jsp");
%>