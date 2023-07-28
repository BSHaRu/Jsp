<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String strAge = request.getParameter("age");
	// String으로 값을 받기 때문에 여기서 int로 바꿔줘야 됨
	// 아니면 아싸리 setString으로 받거나
	// setString으로 받을 때 Integer를 통해서 타입변환 해줘야함
	int age = Integer.parseInt(strAge);
	
	// db 처리
	String host = "jdbc:mysql://localhost:3306/userdb";
	String user = "root";
	String pass = "1234";
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		String sql = "INSERT INTO user1 VALUES(?,?,?,?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, uid);
		psmt.setString(2, name);
		psmt.setString(3, hp);
		psmt.setInt(4, age);
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
	}catch(Exception e){
		System.out.println(e.getMessage());
	}
	
	response.sendRedirect("/Ch06/user1/list.jsp");
%>