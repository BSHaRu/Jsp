<%@page import="dao.ArticleDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String strNo = request.getParameter("no");
	String strParent = request.getParameter("parent");
	int no = Integer.parseInt(strNo);
	int parent = Integer.parseInt(strParent);
	
	ArticleDAO dao = new ArticleDAO();
	// 댓글 삭제
	dao.deleteContent(no);
	
	// 댓글 숫자 삭제
	dao.updateCommentCountMin(parent);
	
	response.sendRedirect("/Jboard/view.jsp?no="+parent);
%>