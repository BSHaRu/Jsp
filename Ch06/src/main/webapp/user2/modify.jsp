<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="vo.User1VO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");

	User1VO vo = null;
	try{
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env");
		
		DataSource ds = (DataSource) ctx.lookup("jdbc/userdb");
		Connection conn = ds.getConnection();
		
		String sql = "SELECT * FROM user1 WHERE uid = ?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, uid);
		
		ResultSet rs = psmt.executeQuery();
		if(rs.next()){
			vo = new User1VO();
			vo.setUid(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setHp(rs.getString(3));
			vo.setAge(rs.getInt(4));
		}
		rs.close();
		psmt.close();
		conn.close();
	}catch(Exception e){
		e.getMessage();
	}
%>        
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>user2::modify</title>
</head>
<body>
	<h3>User2 수정</h3>
	<a href="/Ch06/2_DBCP.jsp">처음으로</a>
	<a href="/Ch06/user2/register.jsp">User1 등록</a>
	
	<form action="/Ch06/user2/modifyPrco.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="uid" value="<%= vo.getUid() %>" readonly />
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="name" value="<%= vo.getName() %>"/>
				</td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td>
					<input type="text" name="hp" value="<%= vo.getHp() %>"/>
				</td>
			</tr>
			<tr>
				<td>나이</td>
				<td>
					<input type="number" name="age" value="<%= vo.getAge() %>"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="수정" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>