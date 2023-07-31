<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>user2::register</title>
</head>
<body>
	<h3>User2 등록</h3>
	<a href="/Ch06/2_DBCP.jsp">처음으로</a>
	<a href="/Ch06/user2/register.jsp">User2 등록</a>
	<a href="/Ch06/user2/list.jsp">User2 list</a>
	
	<!-- insert는 보통 post 방식으로 보냄 -->
	<form action="/Ch06/user2/registerPrco.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="uid" />
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="name" />
				</td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td>
					<input type="text" name="hp" />
				</td>
			</tr>
			<tr>
				<td>나이</td>
				<td>
					<input type="number" name="age" />
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="등록" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>