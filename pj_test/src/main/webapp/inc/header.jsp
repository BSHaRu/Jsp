<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>

<f:requestEncoding value="UTF-8" />   
<!-- 절대 경로 -->
<c:url var="path" value="/" />  

<jsp:useBean id="user" class="vo.UserVO" />
	<jsp:setProperty property="*" name="user" />
	
<jsp:useBean id="free" class="vo.Free_boardVO" />
	<jsp:setProperty property="*" name="free" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <title>pj_test</title>

    <link rel="stylesheet" href="${path}/css/style.css">
</head>
<body>
    <div id="container">
        <header>
            <h3>pj test Board System v1.0</h3>
            <p>
                ㅇㅇㅇ님 반갑습니다.
                <a href="${path }/sign/logout.jsp" class="logout">[로그아웃]</a>
            </p>
        </header>
  