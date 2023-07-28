<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String strAge = request.getParameter("age");
	int age = Integer.parseInt(strAge);
	
	String drive = "com.mysql.cj.jdbc.Driver";
	String host = "jdbc:mysql://localhost:3306/userdb";
	String user = "root";
	String pass = "1234";
	
	try{
		Class.forName(drive);
		Connection conn = DriverManager.getConnection(host, user, pass);
		String sql = "UPDATE user1 SET " 
					+ " name = ?, "
					+ " hp = ?, "
					+ " age = ? "
					+ " WHERE uid = ? ";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, name);
		psmt.setString(2, hp);
		psmt.setInt(3, age);
		psmt.setString(4, uid);
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
	}catch(Exception e){
		e.getMessage();
	}
	
	response.sendRedirect("/Ch06/user1/list.jsp");
%>