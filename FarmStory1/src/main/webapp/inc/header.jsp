<%@page import="dto.*, dao.*, util.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserDTO sessUser 
		= (UserDTO) session.getAttribute("sessUser");
%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>팜스토리</title>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"/>
    <link rel="stylesheet" href="/FarmStory1/css/style.css"/>
    <link rel="stylesheet" href="/FarmStory1/css/user.css"/>
</head>
<body>
    <div id="container">
        <header>
            <a href="/FarmStory1/index.jsp" class="logo">
           		<img src="/FarmStory1/images/logo.png" alt="로고"/>
            </a>
            <p>
                <a href="/FarmStory1/index.jsp">HOME |</a>
                <% if(sessUser == null){ %>
                <a href="/FarmStory1/user/login.jsp">로그인 |</a>
                <a href="/FarmStory1/user/terms.jsp">회원가입 |</a>
                <% }else{ %>
                	<% if(sessUser.getRole().equals("ADMIN")){ %>
	                <a href="/FarmStory1/admin/index.jsp">관리자 |</a>
	                <% } %>
                <a href="/FarmStory1/user/logout.jsp"> 로그아웃 |</a>
                <% } %>
                <a href="#">고객센터</a>
            </p>
            <img src="/FarmStory1/images/head_txt_img.png" alt="3만원 이상 무료배송"/>
            
            <ul class="gnb">
                <li><a href="/FarmStory1/introduction/hello.jsp">팜스토리소개</a></li>
                <li>
                	<a href="/FarmStory1/market/list.jsp">
	                	<img src="/FarmStory1/images/head_menu_badge.png" alt="30%"/>장보기
	                </a>
                </li>
                <li><a href="/FarmStory1/board/list.jsp?group=croptalk&cate=story">농작물이야기</a></li>
                <li><a href="/FarmStory1/board/list.jsp?group=event&cate=event">이벤트</a></li>
                <li><a href="/FarmStory1/board/list.jsp?group=community&cate=notice">커뮤니티</a></li>
            </ul>
        </header>