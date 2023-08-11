<%@page import="dao.ArticleDAO"%>
<%@page import="vo.ArticleVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String strNo = request.getParameter("no");
	int no = Integer.parseInt(strNo);
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	//String strFile = request.getParameter("file");
	//int file = Integer.parseInt(strFile);
	//System.out.println("6");
	
	ArticleVO vo = new ArticleVO();
	vo.setNo(no);
	vo.setTitle(title);
	vo.setContent(content);
	//vo.setFile(file);
	
	ArticleDAO dao = new ArticleDAO();
	dao.updateArticle(vo);
	
	response.sendRedirect("/Jboard/view.jsp?no="+no);
%>