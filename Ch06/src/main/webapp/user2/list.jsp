<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="vo.User1VO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
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
			User1VO vo = new User1VO();
			vo.setUid(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setHp(rs.getString(3));
			vo.setAge(rs.getInt(4));
			
			users.add(vo);
		}		
		rs.close();
		conn.close();
	}catch(Exception e){
		System.out.println(e.getMessage());
	}
%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>user2 :: list</title>
</head>
<body>
	<h3>User2 목록</h3>
	<a href="/Ch06/2_DBCP.jsp">처음으로</a>
	<a href="/Ch06/user2/register.jsp">User2 등록</a>
	
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>휴대폰</th>
			<th>나이</th>
			<th>관리</th>
		</tr>
		
		<% for(User1VO vo : users) { %>
		<tr>
			<th><%= vo.getUid() %></th>
			<th><%= vo.getName() %></th>
			<th><%= vo.getHp() %></th>
			<th><%= vo.getAge() %></th>
			<th>
				<!-- 수정 하기 위해서 id값을 알아야되니깐 get방식으로 넘김 -->
				<a href="/Ch06/user2/modify.jsp?uid=<%= vo.getUid() %>">수정</a>
				<a href="/Ch06/user2/delete.jsp?uid=<%= vo.getUid() %>">삭제</a>
			</th>
		</tr>
		<% } %>
	</table>
</body>
</html>