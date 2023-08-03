<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.*"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String uid = request.getParameter("uid");
	
	Context init = new InitialContext();
	DataSource ds 
		= (DataSource) init.lookup("java:comp/env/jdbc/Jboard");
	Connection conn = ds.getConnection();
	
	PreparedStatement psmt = null;
	ResultSet rs = null;
	String sql ="";
	int result = 0;
	try{
		sql = "SELECT COUNT(*) FROM User WHERE uid = ?";
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, uid);
		rs = psmt.executeQuery();
		// 중복이면 1, 없으면 0
		if(rs.next()) result = rs.getInt(1);
	}catch(Exception e){
		System.out.println(e.getMessage());
	}finally{
		if(rs !=null) rs.close();
    	if(psmt !=null) psmt.close();
    	if(conn !=null) conn.close();
	}
	
	// Json 생성
	JsonObject json = new JsonObject();
	// addProperty(key,value);
	json.addProperty("result", result);
	// Json 출력
	String jsonData = json.toString();
	out.print(jsonData);
%>