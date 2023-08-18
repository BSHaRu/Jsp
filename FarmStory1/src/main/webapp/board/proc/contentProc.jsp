<%@page import="dao.ArticleDAO"%>
<%@page import="dto.ArticleDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	//String strNo = request.getParameter("no");
	String cate = request.getParameter("cate");
	String strParent = request.getParameter("parent");
	String content = request.getParameter("content");
	String writer = request.getParameter("writer");
	String regIp = request.getRemoteAddr();
	int parent = Integer.parseInt(strParent);
	//int no = Integer.parseInt(strNo);
	
	String group = request.getParameter("group");
	
	ArticleDTO dto = new ArticleDTO();
	//dto.setNo(no);
	//dto.setCate(cate);
	dto.setParent(parent);
	dto.setContent(content);
	dto.setWriter(writer);
	dto.setRegIp(regIp);

	ArticleDAO dao = new ArticleDAO();
	dao.insertContent(dto);
	
	response.sendRedirect("/FarmStory1/board/view.jsp?group="+group+"&cate="+cate+"&no="+parent);
%>