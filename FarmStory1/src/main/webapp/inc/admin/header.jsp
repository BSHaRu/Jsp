<%@page import="dto.*, dao.*, util.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserDTO sessUser 
		= (UserDTO) session.getAttribute("sessUser");
	
	if(sessUser == null){
		out.print("<script>");
		out.print("alert('로그인부터 해주세요');");
		out.print("location.href='/FarmStory1/user/login.jsp';");
		out.print("</script>");
		return;
	}

%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>팜스토리</title>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"/>
    <link rel="stylesheet" href="/FarmStory1/admin/css/style.css">
</head>
<body>
    <div id="container">
        <header>
            <a href="/FarmStory1/admin/index.jsp" class="logo"><img src="/FarmStory1/admin/images/admin_logo.jpg" alt="로고"/></a>
            <p>
                <a href="/FarmStory1/index.jsp">HOME |</a>
                <a href="#">로그아웃 |</a>
                <a href="#">고객센터</a>
            </p>
        </header>
