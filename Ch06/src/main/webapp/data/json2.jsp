<%@page import="com.google.gson.Gson"%>
<%@page import="vo.User1VO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
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
		String sql = "SELECT * FROM user1";
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			User1VO user = new User1VO();
			user.setUid(rs.getString(1));
			user.setName(rs.getString(2));
			user.setHp(rs.getString(3));
			user.setAge(rs.getInt(4));
			
			users.add(user);
		}
		
		rs.close();
		stmt.close();
		conn.close();
	}catch(Exception e){
		System.out.println(e.getMessage());
	}
		
	// JSON 출력
	// -> maven에서 gson.jar 다운 받아서 lib 폴더에
	// 이거 사용하는 이유가 json을 편하게 사용하기 위해서임
	Gson gson = new Gson();
	// List에 담긴 users에 있는 데이터를 
	// 바로 문자열 json으로 만들어줌
	String jsonData = gson.toJson(users);
	
	out.print(jsonData);
	
%>