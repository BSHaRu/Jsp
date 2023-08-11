<%@page import="dao.ArticleDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String comment = request.getParameter("comment");
	String strNo = request.getParameter("no");
	int no = Integer.parseInt(strNo);
	String strParent = request.getParameter("parent");
	int parent = Integer.parseInt(strParent);
	
	ArticleDAO dao = new ArticleDAO();
	dao.updateComment(comment, no);

	// no값으로 못넘기는게 no는 결국 댓글 번호라서 no로 넘기면
	// 게시글이 아니라 댓글을 보게되는거임
	response.sendRedirect("/Jboard/view.jsp?no="+parent);
%>