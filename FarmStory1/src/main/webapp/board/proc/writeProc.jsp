<%@page import="dao.ArticleDAO"%>
<%@page import="dto.ArticleDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String group = request.getParameter("group");
	String cate = request.getParameter("cate");
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String file = request.getParameter("file");
	String regIp = request.getRemoteAddr();
	
	ArticleDTO dto = new ArticleDTO();
	dto.setCate(cate);
	dto.setTitle(title);
	dto.setContent(content);
	dto.setWriter(writer);
	dto.setRegIp(regIp);
	
	ArticleDAO dao = new ArticleDAO();
	dao.insertArticle(dto);
	
	// 그냥 list로 못보내는 이유가 
	// 처음부터 list는 header를 통해서 해당 파라미터값을 가진 상태임
	// 그렇기 때문에 list로 보낼 꺼면 group과 cate 두개의 파라미터가
	// 무조건 존재 해야 list로 페이지 이동이 가능함
	response.sendRedirect("/FarmStory1/board/list.jsp?group="+group+"&cate="+cate);
%>