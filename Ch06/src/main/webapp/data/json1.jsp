<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// Java JSON 데이터 생성
	// \ : 이스케이프 라고 해당 문자열 안에 
	// ""가 있는건 문자열로 취급 안해주겠다는 의미
	String jsonData = "{\"uid\":\"a101\", \"name\":\"홍길동\", \"hp\":\"010-1234-1001\", \"age\":23}";
	
	// JSON 출력
	out.print(jsonData);
%>