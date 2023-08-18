<%@page import="dao.ArticleDAO"%>
<%@page import="dto.ArticleDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String strNo = request.getParameter("no");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String file = request.getParameter("file");
	int no = Integer.parseInt(strNo);
	
	String group = request.getParameter("group");
	String cate = request.getParameter("cate");
	
	ArticleDTO dto = new ArticleDTO();
	// ?? no값은 왜??
	dto.setNo(no);
	dto.setTitle(title);
	dto.setContent(content);
	
	ArticleDAO dao = new ArticleDAO();
	dao.updateArticle(dto);
	
	response.sendRedirect("/FarmStory1/board/view.jsp?group="+group+"&cate="+cate+"&no="+no);
%>