<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String email = request.getParameter("eamil");
	
	Context init = new InitialContext();
	DataSource ds 
		= (DataSource) init.lookup("java:comp/env/jdbc/Jboard");
	
	Connection conn = ds.getConnection();
	PreparedStatement psmt = null;
	ResultSet rs = null;
	String sql = "";
	
	int result = 0;
	try{
		sql = "SELECT count(*) FROM User WHERE email = ?";
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, email);
		rs = psmt.executeQuery();
		
		if(rs.next()) result = rs.getInt(1);
		
	}catch(Exception e){
		System.out.println(e.getMessage());
	}finally{
		if(rs !=null) rs.close();
    	if(psmt !=null) psmt.close();
    	if(conn !=null) conn.close();
	}
	
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	
	String jsonData = json.toString();
	out.print(jsonData);
%>