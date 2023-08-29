<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>board</title>
    <link rel="stylesheet" href="/Jboard2/css/style.css"/>    
</head>
<body>
    <div id="wrapper">
        <header>
            <h3>Board System v2.0</h3>
            <p>
                <span> <!-- jstl은 내장 객체인 sessionScope 생략 가능 -->
                	<a href="/Jboard2/user/myInfo.do">${sessUser.nick }</a>
               	</span>님 반갑습니다.
                <a href="/Jboard2/user/login.do">[로그아웃]</a>
            </p>
        </header>
 