<%@page import="dao.*"%>
<%@page import="vo.*"%>
<%@page import="util.SQL"%>
<%@page import="java.sql.*"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String file = request.getParameter("file");
	String writer = request.getParameter("writer");
	String regIp = request.getRemoteAddr();
	
	ArticleVO artVo = new ArticleVO();
	artVo.setTitle(title);
	artVo.setContent(content);
	artVo.setWriter(writer);
	artVo.setRegIp(regIp);
	
	ArticleDAO artDao = new ArticleDAO();	
	artDao.insertArticle(artVo);
	
	response.sendRedirect("/Jboard/list.jsp");
%>