<%@page import="dao.*"%>
<%@page import="com.google.gson.JsonObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String uid = request.getParameter("uid");
	
	int result = UserDAO.getInstance().selectCountUid(uid);
	
	// Json 생성
	JsonObject json = new JsonObject();
	// addProperty(key,value);
	json.addProperty("result", result);
	// Json 출력
	String jsonData = json.toString();
	out.print(jsonData);
%>