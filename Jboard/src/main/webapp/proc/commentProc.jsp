<%@page import="vo.*"%>
<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String strParent = request.getParameter("parent");
	String content = request.getParameter("content");
	String writer = request.getParameter("writer");
	String regIp = request.getRemoteAddr();
	int parent = Integer.parseInt(strParent);
	
	ArticleVO vo = new ArticleVO();
	vo.setParent(parent);
	vo.setContent(content);
	vo.setWriter(writer);
	vo.setRegIp(regIp);
	
	ArticleDAO dao = new ArticleDAO();
	
	// 댓글 입력
	dao.insetContent(vo);
	
	// 댓글 카운터 수정
	dao.updateCommentCountPlus(parent);
	
	response.sendRedirect("/Jboard/view.jsp?no="+parent);
%>