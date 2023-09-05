<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>팜스토리</title>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"/>
    <link rel="stylesheet" href="${path }/css/style.css"/>
    <link rel="stylesheet" href="${path }/css/user.css"/>
</head>
<body>
    <div id="container">
        <header>
            <a href="${path }/index.jsp" class="logo">
            	<img src="${path }/images/logo.png" alt="로고"/>
            </a>
            <p>
                <a href="${path }/index.jsp">HOME |</a>
                <c:choose>
                	<c:when test="${sessUser != null }">
                		<span>${sessUser.nick } 님 반갑습니다. |</span>
	                	<c:if test="${sessUser.role eq 'ADMIN' }">
	                		<a href="${path }/admin/index.jsp">관리자 |</a>
	                	</c:if>
	               		<a href="${path }/user/logout.do">[로그아웃] |</a>
                	</c:when>
                	<c:otherwise>
		                <a href="${path }/user/login.do">로그인 |</a>
		                <a href="${path }/user/register.do">회원가입 |</a>
                	</c:otherwise>
                </c:choose>
                <a href="#">고객센터</a>
            </p>
            <img src="${path }/images/head_txt_img.png" alt="3만원 이상 무료배송"/>
            
            <ul class="gnb">
                <li>
                	<a href="${path }/introduction/hello.do">팜스토리소개</a>
               	</li>
                <li>
	                <a href="${path }/market/list.do">
	                	<img src="${path }/images/head_menu_badge.png" alt="30%"/>장보기
	                </a>
                </li>
                <li>
                	<a href="${path }/board/list.do?group=croptalk&cate=story">농작물이야기</a>
               	</li>
                <li>
               		<a href="${path }/board/list.do?group=event&cate=event">이벤트</a>
               	</li>
                <li>
               	 	<a href="${path }/board/list.do?group=community&cate=notice">커뮤니티</a>
             	</li>
            </ul>
        </header>