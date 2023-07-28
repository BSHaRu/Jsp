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

	String drive = "com.mysql.cj.jdbc.Driver";
	String host = "jdbc:mysql://localhost:3306/userdb";
	String user = "root";
	String pass = "1234";
	
	User1VO vo = null;
	try{
		Class.forName(drive);
		Connection conn = DriverManager.getConnection(host, user, pass);
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
	<title>user1::modify</title>
</head>
<body>
	<h3>User1 수정</h3>
	<a href="/Ch06/1_JDBC.jsp">처음으로</a>
	<a href="/Ch06/user1/register.jsp">User1 등록</a>
	
	<form action="/Ch06/user1/modifyPrco.jsp" method="post">
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