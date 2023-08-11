<%@page import="vo.*, dao.*, util.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserVO sessUser = (UserVO) session.getAttribute("sessUser");
	
	if(sessUser == null){
		response.sendRedirect("/Jboard/user/login.jsp?success=101");
		return;
	}
%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <title>게시판</title>

    <link rel="stylesheet" href="/Jboard/css/style.css">
</head>
<body>
    <div id="container">
        <header>
            <h3><a href="/Jboard">Board System v1.0</a></h3>
            <p>
                <%= sessUser.getNick() %>님 반갑습니다.
                <a href="/Jboard/user/logout.jsp" class="logout">[로그아웃]</a>
            </p>
        </header>
  