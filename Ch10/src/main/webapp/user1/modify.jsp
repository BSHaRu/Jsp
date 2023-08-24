<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>user1::modify</title>
</head>
<body>
	<h3>User1 수정</h3>
	<a href="/Ch10/index.jsp">처음으로</a>
	<a href="list">User1 목록</a>
	
	<form action="modify" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td>
					<!-- el에서는 내장객체(request등) 생략 가능함. 
						el을 사용하면 캡슐화가 적용 안되서 바로 참조 가능
					-->
					<input type="text" name="uid" value="${user.uid }" readonly />
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="name" value="${user.name }"/>
				</td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td>
					<input type="text" name="hp" value="${user.hp }"/>
				</td>
			</tr>
			<tr>
				<td>나이</td>
				<td>
					<input type="number" name="age" value="${user.age }"/>
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