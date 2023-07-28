<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String uid = request.getParameter("uid");
	
	String drive = "com.mysql.cj.jdbc.Driver";
	String host = "jdbc:mysql://localhost:3306/userdb";
	String user = "root";
	String pass = "1234";
	
	try{
		Class.forName(drive);
		Connection conn = DriverManager.getConnection(host, user, pass);
		String sql = "DELETE FROM user1 WHERE uid = ?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, uid);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
	}catch(Exception e){
		e.getMessage();
	}
	
	response.sendRedirect("/Ch06/user1/list.jsp");
%>