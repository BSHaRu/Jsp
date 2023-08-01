<%@page import="com.google.gson.Gson"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="vo.User1VO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<User1VO> users = new ArrayList<>();

	try{
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/userdb");
		Connection conn = ds.getConnection();				
		Statement stmt = conn.createStatement();
		String sql = "SELECT * FROM user3";
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			User1VO vo = new User1VO();
			vo.setUid(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setHp(rs.getString(3));
			vo.setAge(rs.getInt(4));
			
			users.add(vo);
		}		
		rs.close();
		stmt.close();
		conn.close();
	}catch(Exception e){
		System.out.println(e.getMessage());
	}
	
	Gson gson = new Gson();
	String jsonData = gson.toJson(users);
	
	out.println(jsonData);
%>    